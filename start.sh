#!/bin/bash
# --------------------scrapy
spiders=(authorRedis videoRedis bangumiAndDonghua authorAutoAdd videoAutoAdd site online)
for var in ${spiders[@]}
do
    ps -ef | grep $var | grep -v grep | awk '{print $2}' | xargs kill -9
    nohup scrapy crawl "$var" -L INFO 1>log/$var.log 2>&1 &
done

ps -ef | grep DanmakuAggregate | grep -v grep | awk '{print $2}' | xargs kill -9
cd danmaku_spider/ && nohup scrapy crawl DanmakuAggregate 1>../log/log.log 2>&1 &

# --------------------python
ps -ef | grep start_scheduler | grep -v grep | awk '{print $2}' | xargs kill -9
nohup python start_scheduler.py 1> log/start_scheduler.py.log 2>&1 &

ps -ef | grep tag_adder | grep -v grep | awk '{print $2}' | xargs kill -9
nohup python ./biliob_requests/tag_adder.py 1>log/tag_adder.log 2>&1 &

ps -ef | grep run | grep -v grep | awk '{print $2}' | xargs kill -9
nohup python run.py

