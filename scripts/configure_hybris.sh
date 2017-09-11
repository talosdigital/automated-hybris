#!/bin/bash

# Copy local.properties file for External MySQL connectivity

/bin/cp /var/www/codedeploy/hybris/local.properties /home/hybris/hybris/bin/conf
chown -R hybris /home/hybris/hybris

# Copy Service file

/bin/cp /var/www/codedeploy/hybris/hybris.service /usr/lib/systemd/system

systemctl daemon-reload
