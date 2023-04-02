# Set the base image
FROM ros:humble

# Install required dependencies
RUN apt-get update && apt-get install -y \
        ros-${ROS_DISTRO}-rviz2 \
        ros-${ROS_DISTRO}-xacro \
        ros-${ROS_DISTRO}-robot-state-publisher \
        ros-${ROS_DISTRO}-joint-state-publisher \
        ros-${ROS_DISTRO}-joint-state-publisher-gui \
        software-properties-common \
    && add-apt-repository ppa:kisak/kisak-mesa \
    && apt upgrade -y \
    && rm -rf /var/lib/apt/lists/*

# See https://github.com/ros2/rviz/issues/948, to solve the black screen issue.
