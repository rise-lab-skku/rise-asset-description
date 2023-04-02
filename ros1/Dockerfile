# Set the base image
FROM ros1-description:latest

# Copy the package into the workspace
RUN mkdir -p /ros_ws/src
COPY .. /ros_ws/src/rise_asset_description

# Set the ROS version
WORKDIR /ros_ws/src/rise_asset_description
RUN /bin/bash -c "chmod +x launch/display.launch select_ros_version.sh && \
                ./select_ros_version.sh ros1 && \
                cd /ros_ws && \
                source /opt/ros/${ROS_DISTRO}/setup.bash && \
                catkin_make"

# Source the ROS environment
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
RUN echo "source /ros_ws/devel/setup.bash" >> ~/.bashrc

WORKDIR /ros_ws