# Automatically generated build file. Do not edit.
COMPONENT_INCLUDES += /home/sjy/esp/esp-adf/components/audio_board/include /home/sjy/esp/esp-adf/components/audio_board/lyratd_msc_v2_2
COMPONENT_LDFLAGS += -L$(BUILD_DIR_BASE)/audio_board -laudio_board -L/home/sjy/esp/esp-adf/components/audio_board/../audio_hal/driver/zl38063/firmware -lfirmware
COMPONENT_LINKER_DEPS += 
COMPONENT_SUBMODULES += 
COMPONENT_LIBRARIES += audio_board
COMPONENT_LDFRAGMENTS += 
component-audio_board-build: 
