# Automatically generated build file. Do not edit.
COMPONENT_INCLUDES += /home/sjy/esp/esp-adf/components/esp-adf-libs/esp_audio/include /home/sjy/esp/esp-adf/components/esp-adf-libs/esp_codec/include/codec /home/sjy/esp/esp-adf/components/esp-adf-libs/esp_codec/include/processing /home/sjy/esp/esp-adf/components/esp-adf-libs/recorder_engine/include /home/sjy/esp/esp-adf/components/esp-adf-libs/esp_ssdp/include /home/sjy/esp/esp-adf/components/esp-adf-libs/esp_upnp/include /home/sjy/esp/esp-adf/components/esp-adf-libs/esp_sip/include /home/sjy/esp/esp-adf/components/esp-adf-libs/audio_misc/include
COMPONENT_LDFLAGS += -L$(BUILD_DIR_BASE)/esp-adf-libs -lesp-adf-libs -L/home/sjy/esp/esp-adf/components/esp-adf-libs/esp_audio/lib/esp32 -L/home/sjy/esp/esp-adf/components/esp-adf-libs/esp_codec/lib/esp32 -L/home/sjy/esp/esp-adf/components/esp-adf-libs/recorder_engine/lib/esp32 -L/home/sjy/esp/esp-adf/components/esp-adf-libs/esp_ssdp/lib/esp32 -L/home/sjy/esp/esp-adf/components/esp-adf-libs/esp_upnp/lib/esp32 -lesp_processing -lesp_audio -lesp-amr -lesp-amrwbenc -lesp-aac -lesp-ogg-container -lesp-opus -lesp-tremor -lesp-flac -lesp_upnp -lesp-mp3 -lcodec-utils -lesp-g711 -lrecorder_engine  -L/home/sjy/esp/esp-adf/components/esp-adf-libs/esp_sip/lib/esp32 -lesp_sip-v4x -L/home/sjy/esp/esp-adf/components/esp-adf-libs/esp_ssdp/lib/esp32 -lesp_ssdp-v4x
COMPONENT_LINKER_DEPS += 
COMPONENT_SUBMODULES += 
COMPONENT_LIBRARIES += esp-adf-libs
COMPONENT_LDFRAGMENTS += 
component-esp-adf-libs-build: 
