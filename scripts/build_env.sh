#!/bin/bash

# Link config folder to EFS
ln -sfn /home/hybris/hybris/config/ /mnt/efs/hybris/

# Set and Build the Environment
cd /home/hybris/hybris/bin/platform
. ./setantenv.sh
ant clean 
ant initialize
ant all
