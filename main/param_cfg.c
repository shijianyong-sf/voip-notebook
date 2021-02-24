#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "param_cfg.h"

static const char *TAG = "PARAM_CFG";
#define STORAGE_NAMESPACE "storage"


stParamCfgInfo stParamCfg;

void param_cfg_init(void)
{
    nvs_handle_t my_handle;
    size_t len = 0;

    esp_err_t err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES) {
        // NVS partition was truncated and needs to be erased
        // Retry nvs_flash_init
        ESP_ERROR_CHECK(nvs_flash_erase());
        err = nvs_flash_init();
    }
    ESP_ERROR_CHECK(err);
    err = nvs_open(STORAGE_NAMESPACE, NVS_READWRITE, &my_handle);
    ESP_ERROR_CHECK(err);
    err = nvs_set_str (my_handle, "sip url", "udp://102:102@192.168.43.225:5060");
    ESP_ERROR_CHECK(err);

    err = nvs_get_str(my_handle,"sip url",NULL,&len);
    ESP_LOGI(TAG,"read url len:%d",len);
    err = nvs_get_str(my_handle,"sip url",stParamCfg.sip_url,&len);
    ESP_ERROR_CHECK(err);
    ESP_LOGI(TAG,"read url:%s",stParamCfg.sip_url);

    err = nvs_set_str (my_handle, "sip no", "105");
    ESP_ERROR_CHECK(err);
    err = nvs_get_str(my_handle,"sip no",NULL,&len);
    ESP_LOGI(TAG,"read no len:%d",len);
    err = nvs_get_str(my_handle,"sip no",stParamCfg.sip_no,&len);
    ESP_ERROR_CHECK(err);
    ESP_LOGI(TAG,"read no:%s",stParamCfg.sip_no);

    // Close
    nvs_close(my_handle);
}
