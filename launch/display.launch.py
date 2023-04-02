from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration, Command, FindExecutable
from launch_ros.actions import Node
import os


def generate_launch_description():
    description_package = get_package_share_directory('rise_asset_description')

    # Declare the launch arguments
    model_arg = DeclareLaunchArgument(
        'model',
        default_value=os.path.join(description_package, 'assets', 'xacro', 'honeycomb_table', 'honeycomb_table.urdf.xacro'),
        description='Path to the xacro model file.'
    )
    rvizconfig_arg = DeclareLaunchArgument(
        'rvizconfig',
        default_value=os.path.join(description_package, 'rviz', 'default.ros2.rviz'),
        description='Path to the RViz config file.'
    )

    # Nodes
    robot_description = Command([FindExecutable(name='xacro'), ' ', LaunchConfiguration('model')])

    return LaunchDescription([
        model_arg,
        rvizconfig_arg,
        Node(
            package='joint_state_publisher_gui',
            executable='joint_state_publisher_gui',
            name='joint_state_publisher_gui',
        ),
        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            name='robot_state_publisher',
            output='screen',
            parameters=[{'robot_description': robot_description}],
        ),
        Node(
            package='rviz2',
            executable='rviz2',
            arguments=['-d', LaunchConfiguration('rvizconfig')],
        ),
    ])
