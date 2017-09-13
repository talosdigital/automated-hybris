#!/bin/bash

# Download and Configure Apache SOLR

cd /opt
wget http://apache.mirrors.lucidnetworks.net/lucene/solr/6.6.1/solr-6.6.1-src.tgz
tar -xvf solr-6.6.1-src.tgz
mv /opt/solr-6.6.1 /opt/solr
mv /opt/solr/example /opt/solr/core

# Copy Service file
/bin/cp /opt/codedeploy/solr/solr /etc/init.d
chmod +x /etc/init.d/solr

chkconfig --add solr

systemctl daemon-reload

#Add Firewall Rule for External Access
setenforce 0
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=8983/tcp --permanent
firewall-cmd --reload
