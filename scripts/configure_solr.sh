#!/bin/bash

# Download and Configure Apache SOLR

cd /opt
wget http://apache.mirrors.lucidnetworks.net/lucene/solr/6.6.1/solr-6.6.1-src.tgz
tar -xvf solr-6.6.1-src.tgz
mv /opt/solr-6.6.1-src /opt/solr
mv /opt/solr/example /opt/solr/core
