#!/bin/sh
home=`pwd`
cd ${home}/../web-presentation
./build-image.sh

cd ${home}/../node-js-sceleton
./build-image.sh

cd ${home}

# local
# docker-compose stop
# docker rm $(docker ps -a status=exited)
# docker-compose up -d
# remote
deployAddress="46.101.204.43"
ssh root@${deployAddress} mkdir /opt/gotocanteen
scp -r ./docker-compose.yml root@${deployAddress}:/opt/gotocanteen
ssh root@${deployAddress} docker-compose -f /opt/gotocanteen/docker-compose.yml stop
ssh root@${deployAddress} docker-compose -f /opt/gotocanteen/docker-compose.yml up -d