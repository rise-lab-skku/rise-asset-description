#!/bin/bash

# This script is used to switch between ROS1 and ROS2.
# It copies the CMakeLists.txt and package.xml files from the ros1 or ros2 directories.
#
# Usage:
#   select_ros_version.sh ros1
#   select_ros_version.sh ros2

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ros1|ros2>"
    exit 1
fi

if [ "$1" == "ros1" ]; then
    cp ./ros1/CMakeLists.ros1.txt ./CMakeLists.txt
    cp ./ros1/package.ros1.xml ./package.xml
    echo "CMakeLists.txt and package.xml have been updated to use ROS1."
elif [ "$1" == "ros2" ]; then
    cp ./ros2/CMakeLists.ros2.txt ./CMakeLists.txt
    cp ./ros2/package.ros2.xml ./package.xml
    echo "CMakeLists.txt and package.xml have been updated to use ROS2."
else
    echo "Invalid argument. Please use 'ros1' or 'ros2'."
    exit 1
fi
