#!/bin/sh
#确保为中国时区
#sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
redis-server config/redis.conf
sudo  nginx
#mongod -f /usr/local/system/src/mongodb/conf/mongodb.conf
#rake ts:index #首次运行
#rake ts:start RAILS_ENV=development
rails s thin -d
#thin start -d