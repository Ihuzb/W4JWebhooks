#!/bin/bash
W4J_PATH='/home/ihuzb/'$1
W4J_HOT="W4JHotComments"
W4J_DATA="W4JDataService"

echo "***开始部署***"
cd $W4J_PATH
git pull origin master
echo "***更新结束***"
if [ "$1"="$W4J_HOT" ];then
    NODE_LOG_DIR=/tmp ENABLE_NODE_LOG=YES pm2 reload index.js
else
    echo "$W4J_DATA"
fi

if [ "$1"="$W4J_DATA" ];then
    NODE_LOG_DIR=/tmp ENABLE_NODE_LOG=YES pm2 reload ./bin/www
else
    echo "$W4J_HOT"
fi
echo "***部署结束***"