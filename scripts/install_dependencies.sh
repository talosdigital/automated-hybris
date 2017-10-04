#!/bin/bash

# Update system
yum -y update

yum -y install git wget java awscli nfs-utils lsof firewalld
