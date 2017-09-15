#!/bin/bash

#Create folder and mount EFS volume
mkdir -p /mnt/efs
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 fs-f449dcbd.efs.us-east-1.amazonaws.com:/ /mnt/efs

#Automount EFS Volume
fstab=/etc/fstab
if [[ $(grep -q "fs-f449dcbd.efs.us-east-1.amazonaws.com" "$fstab") ]]
then
    echo "fs-f449dcbd.efs.us-east-1.amazonaws.com:/ /mnt/efs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,_netdev 0 0" >> /etc/fstab
else
    echo "Entry in fstab exists."
fi
