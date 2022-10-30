#This script will setup the repo

#config
export TAG=latest #tag for dockerfile
export AUTHOR='Maik Knof (@knofm)'
export AUTHOR_EMAIL='maik.knof@rwu.de'
export GENERATE_ROS_PACKAGE=1 #set this to 0 if you dont need a ros package
export GENERATE_INTERFACES=1 #set this to 0 if you dont need custom ros interfaces


################################################
#Get path to the parent directory of this script
REPO=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )

#get dir and name of the repo
REPO_DIR=${REPO%/*}
REPO_NAME=${REPO#*$REPO_DIR/}


TEMPLATE_REPO=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#replace place-holders
find $TEMPLATE_REPO -type f -exec sed -i 's/[REPO_NAME]/$REPO_NAME/g' '{}' ';'
find $TEMPLATE_REPO -type f -exec sed -i 's/[TAG]/$TAG/g' '{}' ';'

#rm template repo
rm -rf $TEMPLATE_REPO
