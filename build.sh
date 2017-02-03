#!/bin/bash

set -e

if [ $# -ne 1 ]; then
	echo "$0 Build mapfish print with stored dependencies"
	echo ""
	echo "Usage : $0 <mapfish print source path>"
	exit 1
fi


SCRIPT_NAME=`dirname $0`
CWD=`pwd`

MY_UID=`id -u $USER`
MY_GID=`id -g $USER`

GRADLE_CACHE=$CWD/$SCRIPT_NAME/dot-gradle

#ls $GRADLE_CACHE

MF_PRINT_SOURCE_PATH=$1

echo "Building Mapfish Print from $MF_PRINT_SOURCE_PATH"

docker run -v $GRADLE_CACHE:/root/.gradle/ -v $MF_PRINT_SOURCE_PATH:/tmp/mapfish-print -ti --rm --workdir=/tmp/mapfish-print java:7-jdk /tmp/mapfish-print/gradlew --offline build
docker run -v $GRADLE_CACHE:/root/.gradle/ -v $MF_PRINT_SOURCE_PATH:/tmp/mapfish-print -ti --rm --workdir=/tmp/mapfish-print java:7-jdk chown -R $MY_UID:$MY_GID /tmp/mapfish-print/build

echo "Build finished in $MF_PRINT_SOURCE_PATH/build:"
ls -lh $MF_PRINT_SOURCE_PATH/build/libs/

