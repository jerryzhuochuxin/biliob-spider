#!/bin/bash
spiders=(authorRedis videoRedis bangumiAndDonghua authorAutoAdd videoAutoAdd site online)
for var in ${spiders[@]}
do
    nohup scrapy crawl "$var" -L INFO 1>log/$var.log 2>&1 &
done
nohup python ./biliob_requests/tag_adder.py 1>log/tag_adder.log 2>&1 &
cd danmaku_spider/ && nohup scrapy crawl DanmakuAggregate 1>../log/log.log 2>&1 &

