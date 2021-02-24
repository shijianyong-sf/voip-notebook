#ifndef __AUDIO_TONEURI_H__
#define __AUDIO_TONEURI_H__

extern const char* tone_uri[];

typedef enum {
    TONE_TYPE_TICK,
    TONE_TYPE_VOLUME_MIN,
    TONE_TYPE_VOLUME_DOWN,
    TONE_TYPE_VOLUME_UP,
    TONE_TYPE_SHUTUP,
    TONE_TYPE_21_TICK,
    TONE_TYPE_SHUTDOWN,
    TONE_TYPE_VOLUME_MAX,
    TONE_TYPE_MAX,
} tone_type_t;

int get_tone_uri_num();

#endif */
