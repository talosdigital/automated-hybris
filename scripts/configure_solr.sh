#!/bin/bash

# Download and Configure Apache SOLR

cd /opt
#wget http://apache.org/dist/lucene/solr/6.6.1/solr-6.6.1.tgz
wget http://archive.apache.org/dist/lucene/solr/6.0.1/solr-6.0.1.tgz
tar xzf solr-6.0.1.tgz solr-6.0.1/bin/install_solr_service.sh --strip-components=2

sudo bash ./install_solr_service.sh solr-6.0.1.tgz

systemctl daemon-reload

#Add Firewall Rule for External Access
setenforce 0
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=8983/tcp --permanent
firewall-cmd --reload
