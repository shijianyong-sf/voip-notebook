# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sjy/esp/voip

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sjy/esp/voip

# Include any dependencies generated for this target.
include esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/depend.make

# Include the progress variables for this target.
include esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.obj: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.obj: /home/sjy/esp/esp-adf/components/wifi_service/src/esp_wifi_setting.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.obj"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.obj   -c /home/sjy/esp/esp-adf/components/wifi_service/src/esp_wifi_setting.c

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.i"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-adf/components/wifi_service/src/esp_wifi_setting.c > CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.i

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.s"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-adf/components/wifi_service/src/esp_wifi_setting.c -o CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.s

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.obj: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.obj: /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_service.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.obj"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.obj   -c /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_service.c

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.i"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_service.c > CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.i

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.s"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_service.c -o CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.s

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.obj: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.obj: /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_ssid_manager.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.obj"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.obj   -c /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_ssid_manager.c

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.i"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_ssid_manager.c > CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.i

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.s"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-adf/components/wifi_service/src/wifi_ssid_manager.c -o CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.s

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.obj: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.obj: /home/sjy/esp/esp-adf/components/wifi_service/smart_config/smart_config.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.obj"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.obj   -c /home/sjy/esp/esp-adf/components/wifi_service/smart_config/smart_config.c

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.i"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-adf/components/wifi_service/smart_config/smart_config.c > CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.i

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.s"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-adf/components/wifi_service/smart_config/smart_config.c -o CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.s

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.obj: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.obj: /home/sjy/esp/esp-adf/components/wifi_service/airkiss_config/airkiss_config.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.obj"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.obj   -c /home/sjy/esp/esp-adf/components/wifi_service/airkiss_config/airkiss_config.c

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.i"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-adf/components/wifi_service/airkiss_config/airkiss_config.c > CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.i

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.s"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-adf/components/wifi_service/airkiss_config/airkiss_config.c -o CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.s

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.obj: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.obj: /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_config.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.obj"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.obj   -c /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_config.c

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.i"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_config.c > CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.i

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.s"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_config.c -o CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.s

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.obj: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/flags.make
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.obj: /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_security.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.obj"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.obj   -c /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_security.c

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.i"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_security.c > CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.i

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.s"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-adf/components/wifi_service/blufi_config/blufi_security.c -o CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.s

# Object files for target __idf_wifi_service
__idf_wifi_service_OBJECTS = \
"CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.obj" \
"CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.obj" \
"CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.obj" \
"CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.obj" \
"CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.obj" \
"CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.obj" \
"CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.obj"

# External object files for target __idf_wifi_service
__idf_wifi_service_EXTERNAL_OBJECTS =

esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/esp_wifi_setting.c.obj
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_service.c.obj
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/src/wifi_ssid_manager.c.obj
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/smart_config/smart_config.c.obj
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/airkiss_config/airkiss_config.c.obj
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_config.c.obj
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/blufi_config/blufi_security.c.obj
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/build.make
esp-idf/wifi_service/libwifi_service.a: esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library libwifi_service.a"
	cd /home/sjy/esp/voip/esp-idf/wifi_service && $(CMAKE_COMMAND) -P CMakeFiles/__idf_wifi_service.dir/cmake_clean_target.cmake
	cd /home/sjy/esp/voip/esp-idf/wifi_service && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_wifi_service.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/build: esp-idf/wifi_service/libwifi_service.a

.PHONY : esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/build

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/clean:
	cd /home/sjy/esp/voip/esp-idf/wifi_service && $(CMAKE_COMMAND) -P CMakeFiles/__idf_wifi_service.dir/cmake_clean.cmake
.PHONY : esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/clean

esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/depend:
	cd /home/sjy/esp/voip && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sjy/esp/voip /home/sjy/esp/esp-adf/components/wifi_service /home/sjy/esp/voip /home/sjy/esp/voip/esp-idf/wifi_service /home/sjy/esp/voip/esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/wifi_service/CMakeFiles/__idf_wifi_service.dir/depend

