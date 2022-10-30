#This script will setup the repo

#config
VERSION=0.0.0
AUTHOR='Maik Knof (@knofm)'
AUTHOR_EMAIL='maik.knof@rwu.de'


################################################
#Get path to the parent directory of this script
REPO=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )

#get dir and name of the repo
REPO_DIR=${REPO%/*}
REPO_NAME=${REPO#*$REPO_DIR/}
#replace "-" with "_"
ROS_REPO_NAME=$(echo $REPO_NAME | tr - _)

TEMPLATE_REPO=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#replace place-holders
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[REPO_NAME\]/${REPO_NAME}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[VERSION\]/${VERSION}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[AUTHOR\]/${AUTHOR}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[AUTHOR_EMAIL\]/${AUTHOR_EMAIL}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[ROS_PACKAGE_NAME\]/${ROS_REPO_NAME}/g"
find $TEMPLATE_REPO -type f | xargs sed -i "s/\[ROS_INTERFACES_NAME\]/${ROS_REPO_NAME}_interfaces/g"

#DOCKER
cp -r $TEMPLATE_REPO/docker $REPO/docker

#ROS REPO
cp -r $TEMPLATE_REPO/ros_package $REPO/$ROS_REPO_NAME
mkdir -p $REPO/$ROS_REPO_NAME/src/$ROS_REPO_NAME
touch $REPO/$ROS_REPO_NAME/src/$ROS_REPO_NAME/__init__.py

#ROS REPO INTERFACES
cp -r $TEMPLATE_REPO/ros_package_interfaces $REPO/${ROS_REPO_NAME}_interfaces

#TESTS
cp -r $TEMPLATE_REPO/tests $REPO/tests

#README
cp $TEMPLATE_REPO/README.md $REPO/README.md

#rm template repo
rm -rf $TEMPLATE_REPO
