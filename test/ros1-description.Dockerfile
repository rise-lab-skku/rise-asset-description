# Set the base image
FROM ros:noetic

# Install required dependencies
RUN apt-get update && apt-get install -y \
        ros-${ROS_DISTRO}-rviz \
        ros-${ROS_DISTRO}-xacro \
        ros-${ROS_DISTRO}-robot-state-publisher \
        ros-${ROS_DISTRO}-joint-state-publisher \
        ros-${ROS_DISTRO}-joint-state-publisher-gui \
    && rm -rf /var/lib/apt/lists/*
