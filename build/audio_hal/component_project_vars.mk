# Automatically generated build file. Do not edit.
COMPONENT_INCLUDES += /home/sjy/esp/esp-adf/components/audio_hal/include /home/sjy/esp/esp-adf/components/audio_hal/driver/include /home/sjy/esp/esp-adf/components/audio_hal/driver/es8388 /home/sjy/esp/esp-adf/components/audio_hal/driver/es8374 /home/sjy/esp/esp-adf/components/audio_hal/driver/es8311 /home/sjy/esp/esp-adf/components/audio_hal/driver/es7243 /home/sjy/esp/esp-adf/components/audio_hal/driver/zl38063 /home/sjy/esp/esp-adf/components/audio_hal/driver/zl38063/api_lib /home/sjy/esp/esp-adf/components/audio_hal/driver/zl38063/example_apps /home/sjy/esp/esp-adf/components/audio_hal/driver/zl38063/firmware /home/sjy/esp/esp-adf/components/audio_hal/driver/tas5805m /home/sjy/esp/esp-adf/components/audio_hal/driver/es7148
COMPONENT_LDFLAGS += -L$(BUILD_DIR_BASE)/audio_hal -laudio_hal -L/home/sjy/esp/esp-adf/components/audio_hal/driver/zl38063/firmware -lfirmware
COMPONENT_LINKER_DEPS += 
COMPONENT_SUBMODULES += 
COMPONENT_LIBRARIES += audio_hal
COMPONENT_LDFRAGMENTS += 
component-audio_hal-build: 
