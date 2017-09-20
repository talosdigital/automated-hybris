#!/bin/bash

# Link config folder to EFS
#ln -sfn /home/hybris/hybris/config/ /mnt/efs/hybris/

# Set and Build the Environment

if [ "$DEPLOYMENT_GROUP_NAME" == "TD-Hybris-HAC" ]
then
cd /home/hybris/hybris/bin/platform
. ./setantenv.sh
ant clean 
ant initialize
ant all
fi

if [ "$DEPLOYMENT_GROUP_NAME" == "TD-Hybris-FE" ]
then
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
source /home/hybris/.bashrc

cd /home/hybris/installer
./install.sh -r b2c_acc initialize
fi

