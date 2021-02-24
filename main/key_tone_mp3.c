/* Play MP3 file from flash

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>

#include "esp_log.h"

#include "audio_element.h"
#include "audio_pipeline.h"
#include "audio_event_iface.h"
#include "audio_error.h"
#include "tone_stream.h"
#include "i2s_stream.h"
#include "mp3_decoder.h"
#include "filter_resample.h"
#include "power_manager.h"
#include "board.h"
#include "input_key_service.h"

#if __has_include("audio_tone_uri.h")
    #include "audio_tone_uri.h"
#else
    #error "please refer the README, and then make the tone file"
#endif

static const char *TAG = "TONE_MP3_EXAMPLE";



QueueHandle_t xToneQueue;
int send_tone_no;
void play_tone(uint8_t tone_no)
{
    int tone = tone_no;//malloc(sizeof(int));
    ESP_LOGI(TAG,"ToneNo:%d",tone_no);
    if(xToneQueue == NULL)
    {
        return;
    }
    //*tone = tone_no;
    BaseType_t xStatus = xQueueSendToBack( xToneQueue, &tone, 0 );
    if( xStatus != pdPASS )
    {
        ESP_LOGE(TAG, "Could not send to the queue.\r\n" );
    }
}

void key_tone_mp3_task(void *paramenters)
{
    
    audio_pipeline_handle_t pipeline;
    audio_element_handle_t tone_stream_reader, i2s_stream_writer, mp3_decoder;
    audio_event_iface_handle_t evt_pipeline;
    esp_log_level_set(TAG, ESP_LOG_INFO);
    int tone;
    xToneQueue = xQueueCreate( 1, sizeof(int) );
    if(xToneQueue == NULL)
    {
        ESP_LOGE(TAG,"tone queue create failed\r\n");
    }
    while(1)
    {
        BaseType_t xStatus = xQueueReceive( xToneQueue,&tone, portMAX_DELAY );
		if( xStatus == pdPASS )
		{
            audio_power_ctrl(1);
            ESP_LOGI(TAG, "[2.0] Create audio pipeline for playback");
            audio_pipeline_cfg_t pipeline_cfg = DEFAULT_AUDIO_PIPELINE_CONFIG();
            pipeline = audio_pipeline_init(&pipeline_cfg);
            AUDIO_NULL_CHECK(TAG, pipeline, return);

            ESP_LOGI(TAG, "[2.1] Create tone stream to read data from flash");
            tone_stream_cfg_t tone_cfg = TONE_STREAM_CFG_DEFAULT();
            tone_cfg.type = AUDIO_STREAM_READER;
            tone_stream_reader = tone_stream_init(&tone_cfg);

            ESP_LOGI(TAG, "[2.2] Create i2s stream to write data to codec chip");
            i2s_stream_cfg_t i2s_cfg = I2S_STREAM_CFG_DEFAULT();
            i2s_cfg.type = AUDIO_STREAM_WRITER;
            i2s_stream_writer = i2s_stream_init(&i2s_cfg);

            ESP_LOGI(TAG, "[2.3] Create mp3 decoder to decode mp3 file");
            mp3_decoder_cfg_t mp3_cfg = DEFAULT_MP3_DECODER_CONFIG();

            mp3_decoder = mp3_decoder_init(&mp3_cfg);

            rsp_filter_cfg_t rsp_cfg = DEFAULT_RESAMPLE_FILTER_CONFIG();
            
            rsp_cfg.src_rate = 16000;//CODEC_SAMPLE_RATE;
            rsp_cfg.src_ch = 1;//CODEC_CHANNELS;
            rsp_cfg.dest_rate = 8000;//I2S_SAMPLE_RATE;
            rsp_cfg.dest_ch = 1;//44100;
            rsp_cfg.complexity = 0;
            audio_element_handle_t filter = rsp_filter_init(&rsp_cfg);

            ESP_LOGI(TAG, "[2.4] Register all elements to audio pipeline");
            audio_pipeline_register(pipeline, tone_stream_reader, "tone");
            audio_pipeline_register(pipeline, mp3_decoder, "mp3");
            audio_pipeline_register(pipeline, filter, "filter");

            audio_pipeline_register(pipeline, i2s_stream_writer, "i2s");

            ESP_LOGI(TAG, "[2.5] Link it together [flash]-->tone_stream-->mp3_decoder-->i2s_stream-->[codec_chip]");
            const char *link_tag[4] = {"tone", "mp3", "filter","i2s"};
            audio_pipeline_link(pipeline, &link_tag[0], 4);

            ESP_LOGI(TAG, "[2.6] Set up  uri (file as tone_stream, mp3 as mp3 decoder, and default output is i2s)");
            audio_element_set_uri(tone_stream_reader, tone_uri[tone]);

            ESP_LOGI(TAG, "[ 3 ] Set up event listener");
            audio_event_iface_cfg_t evt_cfg = AUDIO_EVENT_IFACE_DEFAULT_CFG();
            evt_pipeline = audio_event_iface_init(&evt_cfg);

            ESP_LOGI(TAG, "[3.1] Listening event from all elements of pipeline");
            audio_pipeline_set_listener(pipeline, evt_pipeline);

            ESP_LOGI(TAG, "[ 4 ] Start audio_pipeline");
            audio_pipeline_run(pipeline);

            ESP_LOGI(TAG, "[ 4 ] Listen for all pipeline events");
            while (1) {
                audio_event_iface_msg_t msg = { 0 };
                esp_err_t ret = audio_event_iface_listen(evt_pipeline, &msg, portMAX_DELAY);
                if (ret == ESP_OK) 
                {
                    if (msg.source_type == AUDIO_ELEMENT_TYPE_ELEMENT && msg.source == (void *) mp3_decoder
                        && msg.cmd == AEL_MSG_CMD_REPORT_MUSIC_INFO) {
                        audio_element_info_t music_info = {0};
                        audio_element_getinfo(mp3_decoder, &music_info);

                        ESP_LOGI(TAG, "[ * ] Receive music info from mp3 decoder, sample_rates=%d, bits=%d, ch=%d",
                                music_info.sample_rates, music_info.bits, music_info.channels);

                        audio_element_setinfo(i2s_stream_writer, &music_info);
                        i2s_stream_set_clk(i2s_stream_writer, 8000/*music_info.sample_rates*/, music_info.bits, music_info.channels);
                        continue;
                    }

                    /* Stop when the last pipeline element (i2s_stream_writer in this case) receives stop event */
                    if (msg.source_type == AUDIO_ELEMENT_TYPE_ELEMENT && msg.source == (void *) tone_stream_reader
                        && msg.cmd == AEL_MSG_CMD_REPORT_STATUS
                        && (((int)msg.data == AEL_STATUS_STATE_FINISHED))) {
                        ESP_LOGW(TAG, "[ * ] Stop event received");
                        break;
                    }
                }

            }

            ESP_LOGI(TAG, "[ 5 ] Stop audio_pipeline");
            audio_pipeline_stop(pipeline);
            audio_pipeline_wait_for_stop(pipeline);
            audio_pipeline_terminate(pipeline);

            audio_pipeline_unregister(pipeline, tone_stream_reader);
            audio_pipeline_unregister(pipeline, i2s_stream_writer);
            audio_pipeline_unregister(pipeline, mp3_decoder);

            /* Terminal the pipeline before removing the listener */
            audio_pipeline_remove_listener(pipeline);

            /* Make sure audio_pipeline_remove_listener & audio_event_iface_remove_listener are called before destroying event_iface */
            audio_event_iface_destroy(evt_pipeline);

            /* Release all resources */
            audio_pipeline_deinit(pipeline);
            audio_element_deinit(tone_stream_reader);
            audio_element_deinit(i2s_stream_writer);
            audio_element_deinit(mp3_decoder);
            audio_power_ctrl(0);
        }
    }

}
