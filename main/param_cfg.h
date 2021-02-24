#ifndef  _PARAM_CFG_H_
#define  _PARAM_CFG_H_

#include "esp_system.h"

typedef struct 
{
    char sip_url[50];
    char sip_no[10];
}stParamCfgInfo;


extern void param_cfg_init(void);

#endif