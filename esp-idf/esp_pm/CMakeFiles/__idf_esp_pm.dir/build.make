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
include esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/depend.make

# Include the progress variables for this target.
include esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/flags.make

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_locks.c.obj: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/flags.make
esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_locks.c.obj: /home/sjy/esp/esp-idf/components/esp_pm/pm_locks.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_locks.c.obj"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_pm.dir/pm_locks.c.obj   -c /home/sjy/esp/esp-idf/components/esp_pm/pm_locks.c

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_locks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_pm.dir/pm_locks.c.i"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-idf/components/esp_pm/pm_locks.c > CMakeFiles/__idf_esp_pm.dir/pm_locks.c.i

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_locks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_pm.dir/pm_locks.c.s"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-idf/components/esp_pm/pm_locks.c -o CMakeFiles/__idf_esp_pm.dir/pm_locks.c.s

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_trace.c.obj: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/flags.make
esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_trace.c.obj: /home/sjy/esp/esp-idf/components/esp_pm/pm_trace.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_trace.c.obj"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_pm.dir/pm_trace.c.obj   -c /home/sjy/esp/esp-idf/components/esp_pm/pm_trace.c

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_trace.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_pm.dir/pm_trace.c.i"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-idf/components/esp_pm/pm_trace.c > CMakeFiles/__idf_esp_pm.dir/pm_trace.c.i

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_trace.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_pm.dir/pm_trace.c.s"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-idf/components/esp_pm/pm_trace.c -o CMakeFiles/__idf_esp_pm.dir/pm_trace.c.s

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_impl.c.obj: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/flags.make
esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_impl.c.obj: /home/sjy/esp/esp-idf/components/esp_pm/pm_impl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_impl.c.obj"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_esp_pm.dir/pm_impl.c.obj   -c /home/sjy/esp/esp-idf/components/esp_pm/pm_impl.c

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_impl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_pm.dir/pm_impl.c.i"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sjy/esp/esp-idf/components/esp_pm/pm_impl.c > CMakeFiles/__idf_esp_pm.dir/pm_impl.c.i

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_impl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_pm.dir/pm_impl.c.s"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && /home/sjy/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sjy/esp/esp-idf/components/esp_pm/pm_impl.c -o CMakeFiles/__idf_esp_pm.dir/pm_impl.c.s

# Object files for target __idf_esp_pm
__idf_esp_pm_OBJECTS = \
"CMakeFiles/__idf_esp_pm.dir/pm_locks.c.obj" \
"CMakeFiles/__idf_esp_pm.dir/pm_trace.c.obj" \
"CMakeFiles/__idf_esp_pm.dir/pm_impl.c.obj"

# External object files for target __idf_esp_pm
__idf_esp_pm_EXTERNAL_OBJECTS =

esp-idf/esp_pm/libesp_pm.a: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_locks.c.obj
esp-idf/esp_pm/libesp_pm.a: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_trace.c.obj
esp-idf/esp_pm/libesp_pm.a: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/pm_impl.c.obj
esp-idf/esp_pm/libesp_pm.a: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/build.make
esp-idf/esp_pm/libesp_pm.a: esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library libesp_pm.a"
	cd /home/sjy/esp/voip/esp-idf/esp_pm && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp_pm.dir/cmake_clean_target.cmake
	cd /home/sjy/esp/voip/esp-idf/esp_pm && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_esp_pm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/build: esp-idf/esp_pm/libesp_pm.a

.PHONY : esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/build

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/clean:
	cd /home/sjy/esp/voip/esp-idf/esp_pm && $(CMAKE_COMMAND) -P CMakeFiles/__idf_esp_pm.dir/cmake_clean.cmake
.PHONY : esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/clean

esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/depend:
	cd /home/sjy/esp/voip && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sjy/esp/voip /home/sjy/esp/esp-idf/components/esp_pm /home/sjy/esp/voip /home/sjy/esp/voip/esp-idf/esp_pm /home/sjy/esp/voip/esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/esp_pm/CMakeFiles/__idf_esp_pm.dir/depend

