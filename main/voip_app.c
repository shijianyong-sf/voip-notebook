/* VoIP Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/

#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event_loop.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "audio_element.h"
#include "audio_pipeline.h"
#include "audio_event_iface.h"
#include "audio_common.h"
#include "i2s_stream.h"
#include "esp_peripherals.h"
#include "periph_wifi.h"
#include "board.h"
#include "input_key_service.h"

#include "audio_mem.h"
#include "raw_stream.h"
#include "filter_resample.h"
#include "esp_sip.h"
#include "g711_decoder.h"
#include "g711_encoder.h"
#include "led.h"
#include "param_cfg.h"
#include "power_manager.h"
#if __has_include("audio_tone_uri.h")
    #include "audio_tone_uri.h"
#else
    #error "please refer the README, and then make the tone file"
#endif
//#include "bluetooth_service.h"

static const char *TAG = "VOIP_EXAMPLE";

#define I2S_SAMPLE_RATE     8000
#define I2S_CHANNELS        1
#define I2S_BITS            16

#define CODEC_SAMPLE_RATE    8000
#define CODEC_CHANNELS       1



typedef struct 
{
    int type;
    int value;
    TickType_t tick;
    int flag;
}stDoubleKeyInfo;

typedef struct voip_app
{
    int flag;
    TickType_t tick;

}stShutDownInfo;


static sip_handle_t sip;
static audio_element_handle_t raw_read, raw_write;
static audio_pipeline_handle_t recorder, player;
static int8_t system_power = 0;
extern EventGroupHandle_t led_event;
extern stParamCfgInfo stParamCfg;
extern int player_volume;
extern void key_tone_mp3_task(void *paramenters);
extern void play_tone(uint8_t tone_no);
extern esp_err_t input_key_test_cb(periph_service_handle_t handle, periph_service_event_t *evt, void *ctx);





static esp_err_t recorder_pipeline_open()
{
    audio_element_handle_t i2s_stream_reader;
    audio_pipeline_cfg_t pipeline_cfg = DEFAULT_AUDIO_PIPELINE_CONFIG();
    recorder = audio_pipeline_init(&pipeline_cfg);
    AUDIO_NULL_CHECK(TAG, recorder, return ESP_FAIL);

    i2s_stream_cfg_t i2s_cfg = I2S_STREAM_CFG_DEFAULT();
    i2s_cfg.type = AUDIO_STREAM_READER;
    i2s_cfg.uninstall_drv = false;
#if defined CONFIG_ESP_LYRAT_MINI_V1_1_BOARD
    i2s_cfg.i2s_port = 1;
#endif
    i2s_stream_reader = i2s_stream_init(&i2s_cfg);
    audio_element_info_t i2s_info = {0};
    audio_element_getinfo(i2s_stream_reader, &i2s_info);
    i2s_info.bits = I2S_BITS;
    i2s_info.channels = I2S_CHANNELS;
    i2s_info.sample_rates = I2S_SAMPLE_RATE;
    audio_element_setinfo(i2s_stream_reader, &i2s_info);
/*
    rsp_filter_cfg_t rsp_cfg = DEFAULT_RESAMPLE_FILTER_CONFIG();
    rsp_cfg.src_rate = I2S_SAMPLE_RATE;
    rsp_cfg.src_ch = I2S_CHANNELS;
    rsp_cfg.dest_rate = CODEC_SAMPLE_RATE;
    rsp_cfg.dest_ch = CODEC_CHANNELS;
    rsp_cfg.complexity = 5;
    audio_element_handle_t filter = rsp_filter_init(&rsp_cfg);
*/
    g711_encoder_cfg_t g711_cfg = DEFAULT_G711_ENCODER_CONFIG();
    audio_element_handle_t sip_encoder = g711_encoder_init(&g711_cfg);

    raw_stream_cfg_t raw_cfg = RAW_STREAM_CFG_DEFAULT();
    raw_cfg.type = AUDIO_STREAM_READER;
    raw_read = raw_stream_init(&raw_cfg);
    audio_element_set_output_timeout(raw_read, portMAX_DELAY);

    audio_pipeline_register(recorder, i2s_stream_reader, "i2s");
    //audio_pipeline_register(recorder, filter, "filter");
    audio_pipeline_register(recorder, sip_encoder, "sip_enc");
    audio_pipeline_register(recorder, raw_read, "raw");
    const char *link_tag[3] = {"i2s", "sip_enc", "raw"};
    audio_pipeline_link(recorder, &link_tag[0], 3);
    audio_pipeline_run(recorder);
    ESP_LOGI(TAG, " SIP recorder has been created");
    return ESP_OK;
}

static esp_err_t player_pipeline_open()
{
    audio_element_handle_t i2s_stream_writer;
    audio_pipeline_cfg_t pipeline_cfg = DEFAULT_AUDIO_PIPELINE_CONFIG();
    player = audio_pipeline_init(&pipeline_cfg);
    AUDIO_NULL_CHECK(TAG, player, return ESP_FAIL);

    raw_stream_cfg_t raw_cfg = RAW_STREAM_CFG_DEFAULT();
    raw_cfg.type = AUDIO_STREAM_WRITER;
    raw_write = raw_stream_init(&raw_cfg);

    g711_decoder_cfg_t g711_cfg = DEFAULT_G711_DECODER_CONFIG();
    audio_element_handle_t sip_decoder = g711_decoder_init(&g711_cfg);
/*
    rsp_filter_cfg_t rsp_cfg = DEFAULT_RESAMPLE_FILTER_CONFIG();
    rsp_cfg.src_rate = CODEC_SAMPLE_RATE;
    rsp_cfg.src_ch = CODEC_CHANNELS;
    rsp_cfg.dest_rate = I2S_SAMPLE_RATE;
    rsp_cfg.dest_ch = I2S_CHANNELS;
    rsp_cfg.complexity = 5;
    audio_element_handle_t filter = rsp_filter_init(&rsp_cfg);
*/
    i2s_stream_cfg_t i2s_cfg = I2S_STREAM_CFG_DEFAULT();
    i2s_cfg.type = AUDIO_STREAM_WRITER;
    i2s_cfg.uninstall_drv = false;
    i2s_stream_writer = i2s_stream_init(&i2s_cfg);
    audio_element_info_t i2s_info = {0};
    audio_element_getinfo(i2s_stream_writer, &i2s_info);
    i2s_info.bits = I2S_BITS;
    i2s_info.channels = I2S_CHANNELS;
    i2s_info.sample_rates = I2S_SAMPLE_RATE;
    audio_element_setinfo(i2s_stream_writer, &i2s_info);

    audio_pipeline_register(player, raw_write, "raw");
    audio_pipeline_register(player, sip_decoder, "sip_dec");
   // audio_pipeline_register(player, filter, "filter");
    audio_pipeline_register(player, i2s_stream_writer, "i2s");
    const char *link_tag[3] = {"raw", "sip_dec", "i2s"};
    audio_pipeline_link(player, &link_tag[0],3);
    audio_pipeline_run(player);
    ESP_LOGI(TAG, "Speaker has been created");
    return ESP_OK;
}

static ip4_addr_t _get_network_ip()
{
    tcpip_adapter_ip_info_t ip;
    tcpip_adapter_get_ip_info(TCPIP_ADAPTER_IF_STA, &ip);
    return ip.ip;
}

static int _sip_event_handler(sip_event_msg_t *event)
{
    ip4_addr_t ip;
    switch ((int)event->type) {
        case SIP_EVENT_REQUEST_NETWORK_STATUS:
            ESP_LOGD(TAG, "SIP_EVENT_REQUEST_NETWORK_STATUS");
            ip = _get_network_ip();
            if (ip.addr) {
                return true;
            }
            return ESP_OK;
        case SIP_EVENT_REQUEST_NETWORK_IP:
            ESP_LOGD(TAG, "SIP_EVENT_REQUEST_NETWORK_IP");
            ip = _get_network_ip();
            int ip_len = sprintf((char *)event->data, "%s", ip4addr_ntoa(&ip));
            return ip_len;
        case SIP_EVENT_REGISTERED:
            ESP_LOGI(TAG, "SIP_EVENT_REGISTERED");
            xEventGroupSetBits( led_event, SERVICE_CONNECTED_EVENT );
            break;
        case SIP_EVENT_RINGING:
            ESP_LOGI(TAG, "ringing... RemotePhoneNum %s", (char *)event->data);
            audio_power_ctrl(1);
            esp_sip_uas_answer(sip, true);
            xEventGroupSetBits( led_event, CALLING_CONNECTED_EVENT );
            break;
        case SIP_EVENT_INVITING:
            ESP_LOGI(TAG, "SIP_EVENT_INVITING Remote Ring...");
            audio_power_ctrl(1);
            break;
        case SIP_EVENT_BUSY:
            ESP_LOGI(TAG, "SIP_EVENT_BUSY");
            break;
        case SIP_EVENT_HANGUP:
            ESP_LOGI(TAG, "SIP_EVENT_HANGUP");
            xEventGroupSetBits( led_event, SERVICE_CONNECTED_EVENT );
            audio_power_ctrl(0);
            break;
        case SIP_EVENT_AUDIO_SESSION_BEGIN:
            ESP_LOGI(TAG, "SIP_EVENT_AUDIO_SESSION_BEGIN");
            audio_power_ctrl(1);
            recorder_pipeline_open();
            player_pipeline_open();
            break;
        case SIP_EVENT_AUDIO_SESSION_END:
            ESP_LOGI(TAG, "SIP_EVENT_AUDIO_SESSION_END");
            audio_pipeline_stop(player);
            audio_pipeline_wait_for_stop(player);
            audio_pipeline_deinit(player);
            audio_pipeline_stop(recorder);
            audio_pipeline_wait_for_stop(recorder);
            audio_pipeline_deinit(recorder);
            audio_power_ctrl(0);
            break;
        case SIP_EVENT_READ_AUDIO_DATA:
            return raw_stream_read(raw_read, (char *)event->data, event->data_len);
        case SIP_EVENT_WRITE_AUDIO_DATA:
            return raw_stream_write(raw_write, (char *)event->data, event->data_len);
        case SIP_EVENT_READ_DTMF:
            ESP_LOGI(TAG, "SIP_EVENT_READ_DTMF ID : %d ", ((char *)event->data)[0]);
            break;
    }
    return 0;
}

static esp_err_t input_key_service_cb(periph_service_handle_t handle, periph_service_event_t *evt, void *ctx)
{
    audio_board_handle_t board_handle = (audio_board_handle_t) ctx;
    static stDoubleKeyInfo stDoubleKey = {0,0,0};
    static stShutDownInfo stShutDownKey = {0,0};
    static TickType_t click_tick = 0,cur_tick = 0;

    //audio_hal_get_volume(board_handle->audio_hal, &player_volume);
    //ESP_LOGE(TAG, "[ * ] input key id is %d,type:%d", (int)evt->data,(int)evt->type );
    //判断双击
    stDoubleKey.flag = 0;
    cur_tick = xTaskGetTickCount();

    //判断关机标志失效
    if(stShutDownKey.flag == 1)
    {
        if((stShutDownKey.tick + 1000) < cur_tick)
        {
            stShutDownKey.flag = 0;
        }
    }
    if (evt->type == INPUT_KEY_SERVICE_ACTION_CLICK_RELEASE) {
        ESP_LOGE(TAG, "[ * ] input key id is %d", (int)evt->data);

        if((cur_tick < (stDoubleKey.tick+100))&&(stDoubleKey.value == (int)evt->data))
        {
            stDoubleKey.flag = 1;
            ESP_LOGI(TAG,"double click");
        }
        stDoubleKey.tick = cur_tick;
        stDoubleKey.value = (int)evt->data;
        switch ((int)evt->data) {
            case INPUT_KEY_USER_ID_SET:
                ESP_LOGI(TAG, "[ * ] [Play] input key event");

                if(stDoubleKey.flag == 1)
                {
                    stShutDownKey.flag = 1;
                    stShutDownKey.tick = cur_tick;
                    ESP_LOGI(TAG,"ready to shutdown....");
                }
                break;
            case INPUT_KEY_USER_ID_VOLUP:
                ESP_LOGD(TAG, "[ * ] [Vol+] input key event");
                player_volume += 10;
                if (player_volume > 100) {
                    player_volume = 100;
                }
                //audio_hal_set_volume(board_handle->audio_hal, player_volume);
                play_tone(TONE_TYPE_VOLUME_UP);
                ESP_LOGI(TAG, "[ * ] Volume set to %d %%", player_volume);
                break;
            case INPUT_KEY_USER_ID_VOLDOWN:
                ESP_LOGD(TAG, "[ * ] [Vol-] input key event");
                player_volume -= 10;
                if (player_volume < 0) {
                    player_volume = 0;
                }
                //audio_hal_set_volume(board_handle->audio_hal, player_volume);
                play_tone(TONE_TYPE_VOLUME_DOWN);
                ESP_LOGI(TAG, "[ * ] Volume set to %d %%", player_volume);
                break;
        }
    }
    else if(evt->type == INPUT_KEY_SERVICE_ACTION_PRESS) 
    {
        switch ((int)evt->data) {
            case INPUT_KEY_USER_ID_SET:
                ESP_LOGI(TAG, "[ * ] [Play] input key event");
                if(stShutDownKey.flag == 1)
                {
                    if(system_power == 0)
                    {
                        system_power = 1;
                    }
                    else
                    {
                        system_power = 0;
                    }
                    system_power_ctrl(system_power);
                    ESP_LOGI(TAG,"shutdown ....");
                    play_tone(TONE_TYPE_21_TICK);
                    xEventGroupSetBits( led_event, SHUT_DOWN_EVENT);
                    vTaskDelay(300);
                    esp_restart();
                }
                else
                {
                    #if 1
                    sip_state_t sip_state = esp_sip_get_state(sip);
                    if (sip_state < SIP_STATE_REGISTERED) {
                        return ESP_OK;
                    }
                    if (sip_state & SIP_STATE_REGISTERED) {
                        esp_sip_uac_invite(sip, stParamCfg.sip_no);
                    }
                    if (sip_state & SIP_STATE_RINGING) {
                        esp_sip_uas_answer(sip, false);
                    } else if (sip_state & SIP_STATE_ON_CALL) {
                        esp_sip_uac_bye(sip);
                    } else if ((sip_state & SIP_STATE_CALLING) || (sip_state & SIP_STATE_SESS_PROGRESS)) {
                        esp_sip_uac_cancel(sip);
                    }
                    #endif
                }
                break;
            case INPUT_KEY_USER_ID_VOLUP:

                ESP_LOGI(TAG, "[ * ] Volume set to %d %%", player_volume);
                break;
            case INPUT_KEY_USER_ID_VOLDOWN:
                ESP_LOGI(TAG, "[ * ] Volume set to %d %%", player_volume);
                break;
        }
    }
    
    return ESP_OK;
}


void app_main()
{
    esp_log_level_set("*", ESP_LOG_INFO);
    esp_log_level_set(TAG, ESP_LOG_INFO);
    esp_log_level_set("SIP", ESP_LOG_ERROR);
    esp_log_level_set("BUTTON", ESP_LOG_DEBUG);

    param_cfg_init();

    wifi_power_save();

#if 1
    tcpip_adapter_init();

    ESP_LOGI(TAG, "[1.0] Initialize peripherals management");
    esp_periph_config_t periph_cfg = DEFAULT_ESP_PERIPH_SET_CONFIG();
    esp_periph_set_handle_t set = esp_periph_set_init(&periph_cfg);

    ESP_LOGI(TAG, "[1.1] Initialize and start peripherals");
    audio_board_key_init(set);
#endif
    ESP_LOGI(TAG, "[1.2] Start and wait for Wi-Fi network");
#if 0
    periph_wifi_cfg_t wifi_cfg = {
        .ssid = CONFIG_WIFI_SSID,
        .password = CONFIG_WIFI_PASSWORD,
        .listen_interval = 3,

    };
    esp_periph_handle_t wifi_handle = periph_wifi_init(&wifi_cfg);
    esp_periph_start(set, wifi_handle);

    periph_wifi_wait_for_connected(wifi_handle, portMAX_DELAY);

#endif

    xTaskCreatePinnedToCore(ledc_task,"ledc_task",1024*2,NULL,5,NULL,1);

    esp_wifi_set_ps(WIFI_PS_NONE);

    ESP_LOGI(TAG, "[ 2 ] Start codec chip");
    audio_board_handle_t board_handle = audio_board_init();
    audio_hal_ctrl_codec(board_handle->audio_hal, AUDIO_HAL_CODEC_MODE_BOTH, AUDIO_HAL_CTRL_START);

    
    ESP_LOGI(TAG, "[ 3 ] Create and start input key service");
    input_key_service_info_t input_key_info[] = INPUT_KEY_DEFAULT_INFO();
    input_key_service_cfg_t input_cfg = INPUT_KEY_SERVICE_DEFAULT_CONFIG();
    input_cfg.handle = set;
    periph_service_handle_t input_ser = input_key_service_create(&input_cfg);
    input_key_service_add_key(input_ser, input_key_info, INPUT_KEY_NUM);
    periph_service_set_callback(input_ser, input_key_service_cb, (void *)board_handle);
    set_audio_volume_cb((void *)board_handle);
    xTaskCreatePinnedToCore(key_tone_mp3_task, "key_tone_mp3_task", 4096, NULL, 5, NULL, 1/*tskNO_AFFINITY*/);
    xEventGroupSetBits( led_event, WIFI_WATING_CONNECTED_EVENT );
    //电源控制初始化
    audio_power_ctrl(0);
    vTaskDelay(300);
    system_power = 1;
    system_power_ctrl(1);
    play_tone(TONE_TYPE_SHUTUP);

    ESP_LOGI(TAG, "[ 4 ] Create SIP Service");
    sip_config_t sip_cfg = {
        .uri = stParamCfg.sip_url,//CONFIG_SIP_URI,sip_url,//
        .event_handler = _sip_event_handler,
        .send_options = true,
#ifdef CONFIG_SIP_CODEC_G711A
        .acodec_type = SIP_ACODEC_G711A,
#else
        .acodec_type = SIP_ACODEC_G711U,
#endif
    };
    sip = esp_sip_init(&sip_cfg);
    esp_sip_start(sip);
    
    

}

