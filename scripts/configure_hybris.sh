#!/bin/bash

# Copy local.properties file for External MySQL connectivity
/bin/cp /opt/codedeploy/hybris/local.properties /home/hybris/hybris/config
chown -R hybris /home/hybris/hybris

# Copy Service file
/bin/cp /opt/codedeploy/hybris/hybris.service /usr/lib/systemd/system

# Copy MySQL DB Connector
cd /tmp
wget https://dev.mysql.com/get/archives/mysql-connector-java-5.1/mysql-connector-java-5.1.34.zip
unzip mysql-connector-java-5.1.34.zip
cd mysql-connector-java-5.1.34
/bin/cp mysql-connector-java-5.1.34-bin.jar /home/hybris/hybris/bin/platform/lib/dbdriver/mysql-connector-java-5.1.34-bin.jar
chown hybris:hybris /home/hybris/hybris/bin/platform/lib/dbdriver/mysql-connector-java-5.1.34-bin.jar

systemctl daemon-reload

#Add Firewall Rule for External Access
setenforce 0
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=9001/tcp --permanent
firewall-cmd --zone=public --add-port=9002/tcp --permanent
firewall-cmd --reload
