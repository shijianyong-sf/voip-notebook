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
#include "esp_pm.h"

static const char *TAG = "POWER_MANAGER";

#define POWER_GPIO           GPIO_NUM_21
#define AUDIO_REST_PIN    GPIO_NUM_19

int player_volume = 46;
static audio_board_handle_t board_handle;

void set_audio_volume_cb(void *handler)
{
    if(handler != NULL)
    {
        board_handle = (audio_board_handle_t)handler;
    }
}

void audio_power_ctrl(uint32_t level)
{
#if 1
    //gpio_set_direction(GPIO_OUTPUT_PIN_SEL, GPIO_MODE_OUTPUT);
    gpio_set_level(AUDIO_REST_PIN,level);
    vTaskDelay(1);
    if(level)
    {
        ESP_LOGI(TAG,"player_volume:%d",player_volume);
        audio_hal_set_volume(board_handle->audio_hal, player_volume);
        esp_wifi_set_ps(WIFI_PS_NONE);
        
    }
    else
    {
        esp_wifi_set_ps(WIFI_PS_MIN_MODEM);
    }
    vTaskDelay(5);
    
#endif
}

void system_power_ctrl(uint32_t level)
{
    gpio_set_level(POWER_GPIO,level);
}

static void event_handler(void* arg, esp_event_base_t event_base,
                                int32_t event_id, void* event_data)
{
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
    } else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        esp_wifi_connect();
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t* event = (ip_event_got_ip_t*) event_data;
        ESP_LOGI(TAG, "got ip: " IPSTR, IP2STR(&event->ip_info.ip));
    }
}


/*init wifi as sta and set power save mode*/
void wifi_power_save(void)
{
#if 1//CONFIG_IDF_TARGET_ESP32
    esp_pm_config_esp32_t pm_config = {
#elif CONFIG_IDF_TARGET_ESP32S2
    esp_pm_config_esp32s2_t pm_config = {
#endif
            .max_freq_mhz = 80,
            .min_freq_mhz = 10,
#if 1//CONFIG_FREERTOS_USE_TICKLESS_IDLE
            .light_sleep_enable = true
#endif
    };
    ESP_ERROR_CHECK( esp_pm_configure(&pm_config) );

    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());
    esp_netif_t *sta_netif = esp_netif_create_default_wifi_sta();
    assert(sta_netif);

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    ESP_ERROR_CHECK(esp_event_handler_instance_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &event_handler, NULL, NULL));
    ESP_ERROR_CHECK(esp_event_handler_instance_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &event_handler, NULL, NULL));

    wifi_config_t wifi_config = {
        .sta = {
            .ssid = CONFIG_WIFI_SSID,
            .password = CONFIG_WIFI_PASSWORD,
            .listen_interval = 3,
        },
    };
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    ESP_LOGI(TAG, "esp_wifi_set_ps().");
    esp_wifi_set_ps(WIFI_PS_MIN_MODEM);

    //GPIO初始化
    //音频芯片复位脚
    gpio_set_direction(AUDIO_REST_PIN, GPIO_MODE_OUTPUT);
    gpio_set_level(AUDIO_REST_PIN,1);
    gpio_reset_pin(POWER_GPIO);
    gpio_set_level(POWER_GPIO, 0);
    gpio_set_direction(POWER_GPIO, GPIO_MODE_OUTPUT);


}