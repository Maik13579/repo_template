ARG ROS_DISTRO=noetic

FROM base_image:$ROS_DISTRO
WORKDIR /root/catkin_ws
# Get source code
COPY python src/python
COPY ros src/ros

#build python package
RUN cd src/python && python3 setup.py bdist_wheel sdist && pip3 install -e .

#build ros package
RUN source /opt/ros/$ROS_DISTRO/setup.bash && catkin_make
