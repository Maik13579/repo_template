#This script will setup the repo

#config
VERSION=0.0.0
AUTHOR='Maik Knof'
AUTHOR_EMAIL='maik.knof@gmx.de'


################################################
#Get path to the parent directory of this script
REPO=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )

#get dir and name of the repo
REPO_DIR=${REPO%/*}
REPO_NAME=${REPO#*$REPO_DIR/}
#replace "-" with "_"
PYTHON_PACKAGE_NAME=$(echo $REPO_NAME | tr - _)
ROS_PACKAGE_NAME='ros_'$PYTHON_PACKAGE_NAME

#convert to camelcase test_repo -> TestRepo
PACKAGE_NAME_CAMELCASE=$(echo $PYTHON_PACKAGE_NAME | sed -r 's/(^|_)([a-z])/\U\2/g')

TEMPLATE_REPO=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#replace place-holders
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[REPO_NAME\]/${REPO_NAME}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[VERSION\]/${VERSION}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[AUTHOR\]/${AUTHOR}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[AUTHOR_EMAIL\]/${AUTHOR_EMAIL}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[PYTHON_PACKAGE_NAME\]/${PYTHON_PACKAGE_NAME}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[ROS_PACKAGE_NAME\]/${ROS_PACKAGE_NAME}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[ROS_INTERFACES_NAME\]/${ROS_PACKAGE_NAME}_interfaces/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[PACKAGE_NAME_CAMELCASE\]/${PACKAGE_NAME_CAMELCASE}/g"

#DOCKER
cp -r $TEMPLATE_REPO/docker $REPO/docker

#PYTHON
cp -r $TEMPLATE_REPO/python $REPO/python
mv $REPO/python/app/python_package $REPO/python/app/$PYTHON_PACKAGE_NAME

#ROS1 REPO
mkdir $REPO/ros
cp -r $TEMPLATE_REPO/ros/ros_package $REPO/ros/$ROS_PACKAGE_NAME
mkdir -p $REPO/ros/$ROS_PACKAGE_NAME/src/$ROS_PACKAGE_NAME
touch $REPO/ros/$ROS_PACKAGE_NAME/src/$ROS_PACKAGE_NAME/__init__.py
cp $TEMPLATE_REPO/templates/ros1_main.py $REPO/ros/$ROS_PACKAGE_NAME/src/$ROS_PACKAGE_NAME/main.py

#ROS REPO INTERFACES
cp -r $TEMPLATE_REPO/ros/ros_package_interfaces $REPO/ros/${ROS_PACKAGE_NAME}_interfaces

#ROS2 REPO
mkdir $REPO/ros2
cp -r $TEMPLATE_REPO/ros2/ros_package $REPO/ros2/$ROS_PACKAGE_NAME
mkdir -p $REPO/ros2/$ROS_PACKAGE_NAME/$ROS_PACKAGE_NAME
touch $REPO/ros2/$ROS_PACKAGE_NAME/$ROS_PACKAGE_NAME/__init__.py
mkdir -p $REPO/ros2/$ROS_PACKAGE_NAME/resource
touch $REPO/ros2/$ROS_PACKAGE_NAME/resource/$ROS_PACKAGE_NAME

cp $TEMPLATE_REPO/templates/ros2_main.py $REPO/ros2/$ROS_PACKAGE_NAME/$ROS_PACKAGE_NAME/${ROS_PACKAGE_NAME}_node.py

#ROS2 REPO INTERFACES
cp -r $TEMPLATE_REPO/ros2/ros_package_interfaces $REPO/ros2/${ROS_PACKAGE_NAME}_interfaces

#README
cp $TEMPLATE_REPO/templates/README.md $REPO/README.md

#rm template repo
rm -rf $TEMPLATE_REPO
