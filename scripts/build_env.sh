#!/bin/bash

# Set and Build the Environment

cd /home/hybris/hybris/bin/platform
. ./setantenv.sh
ant clean 
ant initialize
ant all
