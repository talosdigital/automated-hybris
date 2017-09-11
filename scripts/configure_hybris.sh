#!/bin/bash

# Copy local.properties file for External MySQL connectivity
/bin/cp /opt/codedeploy/hybris/local.properties /home/hybris/hybris/bin/conf
chown -R hybris /home/hybris/hybris

# Copy Service file
/bin/cp /opt/codedeploy/hybris/hybris.service /usr/lib/systemd/system

systemctl daemon-reload

#Add Firewall Rule for External Access
setenforce 0
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=9001/tcp --permanent
firewall-cmd --zone=public --add-port=9002/tcp --permanent
firewall-cmd --reload
