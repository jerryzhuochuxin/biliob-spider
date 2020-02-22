#!/bin/bash
spiders=(authorRedis videoRedis bangumiAndDonghua authorAutoAdd videoAutoAdd site online)
for var in ${spiders[@]}
do
    ps -ef | grep $var | grep -v grep | awk '{print $2}' | xargs kill -9
done
ps -ef | grep tag_adder | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep DanmakuAggregate | grep -v grep | awk '{print $2}' | xargs kill -9

