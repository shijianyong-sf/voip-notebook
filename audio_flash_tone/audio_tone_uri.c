/*This is tone file*/

const char* tone_uri[] = {
   "flash://tone/0_tick.mp3",
   "flash://tone/1_volume_min.mp3",
   "flash://tone/2_volume_down.mp3",
   "flash://tone/3_volume_up.mp3",
   "flash://tone/4_shutup.mp3",
   "flash://tone/5_21_tick.wav",
   "flash://tone/6_shutdown.mp3",
   "flash://tone/7_volume_max.mp3",
};

int get_tone_uri_num()
{
    return sizeof(tone_uri) / sizeof(char *) - 1;
}
                