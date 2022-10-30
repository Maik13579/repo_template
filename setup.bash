#This script will setup the repo

#config
export TAG=latest #tag for dockerfile
export AUTHOR='Maik Knof (@knofm)'
export AUTHOR_EMAIL='maik.knof@rwu.de'
export GENERATE_ROS_PACKAGE=1 #set this to 0 if you dont need a ros package
export GENERATE_INTERFACES=1 #set this to 0 if you dont need custom ros interfaces


################################################
#Get path to the parent directory of this script
TEMPLATE_REPO=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )

#get dir and name of the repo
REPO_DIR=${TEMPLATE_REPO%/*}
REPO_NAME=${TEMPLATE_REPO#*$REPO_DIR/}


#DOCKER
#replace place-holders
#sed -i 's/search_string/replace_string/' $TEMPLATE_REPO/docker/Dockerfile
