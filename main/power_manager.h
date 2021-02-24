#ifndef  _POWER_MANAGER_H_
#define  _POWER_MANAGER_H_

#include "esp_system.h"

extern void audio_power_ctrl(uint32_t level);
extern void system_power_ctrl(uint32_t level);
extern void audio_power_ctrl(uint32_t level);
extern void wifi_power_save(void);
extern void set_audio_volume_cb(void *handler);
extern void audio_set_volume(void);
#endif
