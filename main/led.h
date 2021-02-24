#ifndef  _LED_H_
#define _LED_H_

#include "esp_system.h"


#define WIFI_WATING_DISCONNECT_EVENT   (0x01<<0)   //等等连接wifi
#define WIFI_WATING_CONNECTED_EVENT    (0x01<<1)   //wifi以连接
#define SERVICE_CONNECTED_EVENT        (0x01<<2)   //网络服务器以连接
#define CALLING_CONNECTED_EVENT        (0x01<<3)   //通话中
#define SHUT_DOWN_EVENT                (0x01<<4)   //关机


extern void ledc_task(void *paramenters);

#endif