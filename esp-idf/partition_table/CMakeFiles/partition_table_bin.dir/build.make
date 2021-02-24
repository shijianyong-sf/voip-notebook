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

# Utility rule file for partition_table_bin.

# Include the progress variables for this target.
include esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/progress.make

esp-idf/partition_table/CMakeFiles/partition_table_bin: partition_table/partition-table.bin
esp-idf/partition_table/CMakeFiles/partition_table_bin: partition_table/partition-table.bin


partition_table/partition-table.bin: partitions_voip_example.csv
partition_table/partition-table.bin: /home/sjy/esp/esp-idf/components/partition_table/gen_esp32part.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sjy/esp/voip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../partition_table/partition-table.bin"
	cd /home/sjy/esp/voip/esp-idf/partition_table && python /home/sjy/esp/esp-idf/components/partition_table/gen_esp32part.py -q --offset 0x8000 --flash-size 4MB /home/sjy/esp/voip/partitions_voip_example.csv /home/sjy/esp/voip/partition_table/partition-table.bin
	cd /home/sjy/esp/voip/esp-idf/partition_table && /usr/local/bin/cmake -E echo "Partition table binary generated. Contents:"
	cd /home/sjy/esp/voip/esp-idf/partition_table && /usr/local/bin/cmake -E echo "*******************************************************************************"
	cd /home/sjy/esp/voip/esp-idf/partition_table && python /home/sjy/esp/esp-idf/components/partition_table/gen_esp32part.py -q --offset 0x8000 --flash-size 4MB /home/sjy/esp/voip/partition_table/partition-table.bin
	cd /home/sjy/esp/voip/esp-idf/partition_table && /usr/local/bin/cmake -E echo "*******************************************************************************"

partition_table_bin: esp-idf/partition_table/CMakeFiles/partition_table_bin
partition_table_bin: partition_table/partition-table.bin
partition_table_bin: esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/build.make

.PHONY : partition_table_bin

# Rule to build all files generated by this target.
esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/build: partition_table_bin

.PHONY : esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/build

esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/clean:
	cd /home/sjy/esp/voip/esp-idf/partition_table && $(CMAKE_COMMAND) -P CMakeFiles/partition_table_bin.dir/cmake_clean.cmake
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/clean

esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/depend:
	cd /home/sjy/esp/voip && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sjy/esp/voip /home/sjy/esp/esp-idf/components/partition_table /home/sjy/esp/voip /home/sjy/esp/voip/esp-idf/partition_table /home/sjy/esp/voip/esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/depend

