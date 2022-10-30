ARG ROS_DISTRO=noetic
ARG ROS_WS=/root/catkin_ws

#ARGUMENTS
########################################################################
#BUILD

FROM ros:$ROS_DISTRO as build
ARG ROS_WS
ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt update \
 && apt install -y --no-install-recommends \
 git \
 python3-pip \
# Install build dependencies here.
# example:
# ros-$ROS_DISTRO-[ros package] \
# && pip install [module] \
# && git clone [repo] \
 && apt purge -y \
 git \
 python3-pip \
 && rm -rf /var/lib/apt/lists*
WORKDIR $ROS_WS/src
# Get source code
COPY [ROS_PACKAGE_NAME] [ROS_PACKAGE_NAME]
COPY [ROS_INTERFACES_NAME] [ROS_INTERFACES_NAME]
WORKDIR $ROS_WS
RUN source /opt/ros/$ROS_DISTRO/setup.bash && catkin_make

#BUILD
########################################################################
#BASE

FROM ros:$ROS_DISTRO-ros-core as base
ARG ROS_WS
ARG ROS_DISTRO
ENV ROS_WS $ROS_WS
ENV ROS_DISTRO $ROS_DISTRO
ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-c"]
COPY docker/ros_entrypoint.sh /ros_entrypoint.sh
ENTRYPOINT ["/ros1_entrypoint.sh"]
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc
RUN echo "source $ROS_WS/devel/setup.bash" >> /root/.bashrc
WORKDIR $ROS_WS

#BASE
########################################################################
#FINAL

FROM base as untested
RUN apt update \
 && apt install -y --no-install-recommends \
 python3-pip \
# Install run dependencies here.
# example:
# ros-$ROS_DISTRO-[ros package] \
# && pip install [module] \
 && apt purge -y \
 python3-pip \
 && rm -rf /var/lib/apt/lists*
COPY --from=build $ROS_WS $ROS_WS
#use rosdep to install ros dependencies
RUN apt update \
 && rosdep update \
 && rosdep install -y -r -q --from-paths src --ignore-src --rosdistro $ROS_DISTRO \
 && rm -rf /var/lib/apt/lists*


#FINAL
########################################################################
#TESTING

FROM untested as test
RUN apt update && apt install -y python3-pip
RUN pip3 install --upgrade pytest pytest-mock
COPY tests/unit_tests /tests
RUN source devel/setup.bash && cd /tests && pytest

FROM untested as tested
#make sure test stage isn't skipped
COPY --from=test /ros_entrypoint.sh /ros_entrypoint.sh


#TESTING
########################################################################
