#!/bin/sh

deployAddress="46.101.187.150"

#copy scenario
ssh root@${deployAddress} mkdir /opt/gotocanteen
scp -r ./docker-compose.yml \
  root@${deployAddress}:/opt/gotocanteen


#stop previous  
ssh root@${deployAddress} docker-compose -f \
  /opt/gotocanteen/docker-compose.yml stop

#pull images
ssh root@${deployAddress} docker-compose -f \
  /opt/gotocanteen/docker-compose.yml pull

#run new
ssh root@${deployAddress} docker-compose -f \
  /opt/gotocanteen/docker-compose.yml up -d