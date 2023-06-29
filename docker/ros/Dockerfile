ARG ROS_DISTRO=noetic

FROM ros-base-image:$ROS_DISTRO
WORKDIR /root/catkin_ws
# Get source code
COPY python /root/python
COPY ros src/ros

#build python package
RUN cd /root/python && python3 setup.py bdist_wheel sdist && pip3 install -e .

#build ros package
RUN source /opt/ros/$ROS_DISTRO/setup.bash && catkin_make
