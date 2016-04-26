#!/bin/bash

world_name=survival-`date +%Y-%m-%d-%T | sed 's/://g'`
cd /root/fig/minecraft/worlds
docker cp minecraft_mc_1:/data/world $world_name
tar zcvf $world_name-backup.tar.gz $world_name
rm -rf $world_name
rm `ls sur*tar.gz | sort | head -n 1`
