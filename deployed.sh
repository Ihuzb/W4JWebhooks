 #!/bin/bash
W4J_PATH='/home/ihuzb/'$1

echo "***开始部署***"
cd $W4J_PATH
git pull origin master
echo "***更新结束***"
if ($1=="W4JHotComments");then
    NODE_LOG_DIR=/tmp ENABLE_NODE_LOG=YES pm2 reload index.js --name W4J
else
    NODE_LOG_DIR=/tmp ENABLE_NODE_LOG=YES pm2 reload ./bin/www --name W4J
fi
echo "***部署结束***"