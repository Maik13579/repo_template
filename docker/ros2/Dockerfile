ARG ROS_DISTRO=humble

FROM ros-base-image:$ROS_DISTRO
WORKDIR /root/ros2_ws
# Get source code
COPY python src/python
COPY ros2 src/ros2 

#build python package
RUN cd src/python && python3 setup.py bdist_wheel sdist && pip3 install -e .

#build ros package
RUN source /opt/ros/$ROS_DISTRO/setup.bash && colcon build --symlink-install