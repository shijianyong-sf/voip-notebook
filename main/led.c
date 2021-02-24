
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "driver/ledc.h"
#include "led.h"
#include "esp_log.h"


#define LEDC_LS_CH2_GPIO       (4)
#define LEDC_GREEN_CHANNEL     LEDC_CHANNEL_2
#define LEDC_LS_CH3_GPIO       (2)
#define LEDC_RED_CHANNEL       LEDC_CHANNEL_3

#define LEDC_TEST_CH_NUM       (2)
#define LEDC_TEST_DUTY         (4000)
#define LEDC_TEST_FADE_TIME    (3000)


#define LEDC_LS_TIMER          LEDC_TIMER_1
#define LEDC_LS_MODE           LEDC_LOW_SPEED_MODE

EventGroupHandle_t led_event;

static const char *TAG = "LED";

void ledc_task(void *paramenters)
{
    int ch;
    int duty = 0;
    EventBits_t uxBits;
    EventBits_t led_status = 0;

    ledc_timer_config_t ledc_timer = {
        .duty_resolution = LEDC_TIMER_13_BIT, // resolution of PWM duty
        .freq_hz = 5000,                      // frequency of PWM signal
        .speed_mode = LEDC_LS_MODE,           // timer mode
        .timer_num = LEDC_LS_TIMER,            // timer index
        .clk_cfg = LEDC_AUTO_CLK,              // Auto select the source clock
    };
    // Set configuration of timer0 for high speed channels
    ledc_timer_config(&ledc_timer);    
    /*
     * Prepare individual configuration
     * for each channel of LED Controller
     * by selecting:
     * - controller's channel number
     * - output duty cycle, set initially to 0
     * - GPIO number where LED is connected to
     * - speed mode, either high or low
     * - timer servicing selected channel
     *   Note: if different channels use one timer,
     *         then frequency and bit_num of these channels
     *         will be the same
     */
    ledc_channel_config_t ledc_channel[LEDC_TEST_CH_NUM] = {
        {
            .channel    = LEDC_GREEN_CHANNEL,
            .duty       = 0,
            .gpio_num   = LEDC_LS_CH2_GPIO,
            .speed_mode = LEDC_LS_MODE,
            .hpoint     = 0,
            .timer_sel  = LEDC_LS_TIMER
        },
        {
            .channel    = LEDC_RED_CHANNEL,
            .duty       = 0,
            .gpio_num   = LEDC_LS_CH3_GPIO,
            .speed_mode = LEDC_LS_MODE,
            .hpoint     = 0,
            .timer_sel  = LEDC_LS_TIMER
        },
    };


    //创建led显示事件
    led_event = xEventGroupCreate();
    if(led_event == NULL)
    {
        ESP_LOGE(TAG,"LED event create faile");
    }
    xEventGroupSetBits( led_event, WIFI_WATING_DISCONNECT_EVENT );

    // Set LED Controller with previously prepared configuration
    for (ch = 0; ch < LEDC_TEST_CH_NUM; ch++) {
        ledc_channel_config(&ledc_channel[ch]);
    }

    // Initialize fade service.
    ledc_fade_func_install(0);
    led_status = WIFI_WATING_DISCONNECT_EVENT;

    while (1) {
  		uxBits = xEventGroupWaitBits(
  					led_event,	// The event group being tested.
  					0x0f,	    // The bits within the event group to wait for.
  					pdTRUE,		// BIT_0 and BIT_4 should be cleared before returning.
  					pdFALSE,	// Don't wait for both bits, either bit will do.
  					0 );	    // Wait a maximum of 100ms for either bit to be set.
        if(uxBits != 0)
        {
            led_status = uxBits;
        }
        switch (led_status)
        {
        //wifi未连接，红的闪烁，绿灯长亮
        case WIFI_WATING_DISCONNECT_EVENT:
            ledc_set_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel, duty);
            ledc_update_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel);
            ledc_set_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel, 0);
            ledc_update_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel);
            vTaskDelay(500 / portTICK_PERIOD_MS);
            break;
        //FS服务器未连接上，红的呼吸，绿灯熄灭
        case WIFI_WATING_CONNECTED_EVENT:
            ledc_set_fade_with_time(ledc_channel[0].speed_mode,
                    ledc_channel[0].channel, duty, LEDC_TEST_FADE_TIME);
            ledc_fade_start(ledc_channel[0].speed_mode,
                    ledc_channel[0].channel, LEDC_FADE_NO_WAIT);

            ledc_set_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel, 0);
            ledc_update_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel);
            vTaskDelay(LEDC_TEST_FADE_TIME / portTICK_PERIOD_MS);
            break;
        //绿灯常亮，红的熄灭
        case CALLING_CONNECTED_EVENT:
            ledc_set_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel, 0);
            ledc_update_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel);
            ledc_set_fade_with_time(ledc_channel[1].speed_mode,
                    ledc_channel[1].channel, duty, LEDC_TEST_FADE_TIME);
            ledc_fade_start(ledc_channel[1].speed_mode,
                    ledc_channel[1].channel, LEDC_FADE_NO_WAIT);
            vTaskDelay(LEDC_TEST_FADE_TIME / portTICK_PERIOD_MS);
            break;
        //绿灯呼叫，，红的熄灭
        case SERVICE_CONNECTED_EVENT:
            ledc_set_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel, 0);
            ledc_update_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel);

            ledc_set_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel, LEDC_TEST_DUTY);
            ledc_update_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel);
            vTaskDelay(3000 / portTICK_PERIOD_MS);
            break;
        //关机
        case SHUT_DOWN_EVENT:
            ledc_set_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel, 0);
            ledc_update_duty(ledc_channel[0].speed_mode, ledc_channel[0].channel);

            ledc_set_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel, 0);
            ledc_update_duty(ledc_channel[1].speed_mode, ledc_channel[1].channel);
            vTaskDelay(3000 / portTICK_PERIOD_MS);
        break;
        default:
            vTaskDelay(LEDC_TEST_FADE_TIME / portTICK_PERIOD_MS);
            break;
        }
        
        if(duty == 0)
        {
            duty = LEDC_TEST_DUTY;
        }
        else
        {
            duty = 0;
        }
    }
}