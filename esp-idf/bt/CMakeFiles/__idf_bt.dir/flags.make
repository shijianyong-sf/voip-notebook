# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# compile C with /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
C_FLAGS = -mlongcalls -Wno-frame-address   -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -ggdb -Og -std=gnu99 -Wno-old-style-declaration -D_GNU_SOURCE -DIDF_VER=\"v4.3-dev-1901-g178b122c1-dirty\" -DESP_PLATFORM -Wno-implicit-fallthrough -Wno-unused-const-variable

C_DEFINES = -DADF_VER=\"\" -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\"

C_INCLUDES = -I/home/sjy/esp/voip/config -I/home/sjy/esp/esp-idf/components/bt/include -I/home/sjy/esp/esp-idf/components/bt/common/osi/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/api/include/api -I/home/sjy/esp/esp-idf/components/bt/common/btc/include -I/home/sjy/esp/esp-idf/components/bt/common/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/ar/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/av/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/dm/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/gatt/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/hf_ag/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/hf_client/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/hh/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/jv/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/sdp/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/bta/sys/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/device/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/hci/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/external/sbc/decoder/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/external/sbc/encoder/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/external/sbc/plc/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/btc/profile/esp/blufi/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/btc/profile/esp/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/btc/profile/std/a2dp/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/btc/profile/std/hid/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/btc/profile/std/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/btc/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/btm/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/gap/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/gatt/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/l2cap/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/sdp/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/smp/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/avct/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/avrc/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/avdt/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/a2dp/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/rfcomm/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/stack/include -I/home/sjy/esp/esp-idf/components/bt/host/bluedroid/common/include -I/home/sjy/esp/esp-idf/components/newlib/platform_include -I/home/sjy/esp/esp-idf/components/freertos/include -I/home/sjy/esp/esp-idf/components/freertos/port/xtensa/include -I/home/sjy/esp/esp-idf/components/esp_hw_support/include -I/home/sjy/esp/esp-idf/components/esp_hw_support/port/esp32/. -I/home/sjy/esp/esp-idf/components/heap/include -I/home/sjy/esp/esp-idf/components/log/include -I/home/sjy/esp/esp-idf/components/lwip/include/apps -I/home/sjy/esp/esp-idf/components/lwip/include/apps/sntp -I/home/sjy/esp/esp-idf/components/lwip/lwip/src/include -I/home/sjy/esp/esp-idf/components/lwip/port/esp32/include -I/home/sjy/esp/esp-idf/components/lwip/port/esp32/include/arch -I/home/sjy/esp/esp-idf/components/lwip/port/esp32/tcp_isn -I/home/sjy/esp/esp-idf/components/soc/include -I/home/sjy/esp/esp-idf/components/soc/esp32/. -I/home/sjy/esp/esp-idf/components/soc/esp32/include -I/home/sjy/esp/esp-idf/components/hal/esp32/include -I/home/sjy/esp/esp-idf/components/hal/include -I/home/sjy/esp/esp-idf/components/esp_rom/include -I/home/sjy/esp/esp-idf/components/esp_common/include -I/home/sjy/esp/esp-idf/components/esp_system/include -I/home/sjy/esp/esp-idf/components/esp32/include -I/home/sjy/esp/esp-idf/components/driver/include -I/home/sjy/esp/esp-idf/components/driver/esp32/include -I/home/sjy/esp/esp-idf/components/esp_ringbuf/include -I/home/sjy/esp/esp-idf/components/efuse/include -I/home/sjy/esp/esp-idf/components/efuse/esp32/include -I/home/sjy/esp/esp-idf/components/xtensa/include -I/home/sjy/esp/esp-idf/components/xtensa/esp32/include -I/home/sjy/esp/esp-idf/components/espcoredump/include -I/home/sjy/esp/esp-idf/components/esp_timer/include -I/home/sjy/esp/esp-idf/components/esp_ipc/include -I/home/sjy/esp/esp-idf/components/esp_pm/include -I/home/sjy/esp/esp-idf/components/vfs/include -I/home/sjy/esp/esp-idf/components/esp_wifi/include -I/home/sjy/esp/esp-idf/components/esp_wifi/esp32/include -I/home/sjy/esp/esp-idf/components/esp_event/include -I/home/sjy/esp/esp-idf/components/esp_netif/include -I/home/sjy/esp/esp-idf/components/esp_eth/include -I/home/sjy/esp/esp-idf/components/tcpip_adapter/include -I/home/sjy/esp/esp-idf/components/app_trace/include -I/home/sjy/esp/esp-idf/components/nvs_flash/include -I/home/sjy/esp/esp-idf/components/spi_flash/include -I/home/sjy/esp/esp-idf/components/mbedtls/port/include -I/home/sjy/esp/esp-idf/components/mbedtls/mbedtls/include -I/home/sjy/esp/esp-idf/components/mbedtls/esp_crt_bundle/include 

