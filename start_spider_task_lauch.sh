#!/bin/bash
export BILIOB_REDIS_CONNECTION_STRING=redis://:123456@127.0.0.1:6379
export BILIOB_MONGO_URL=mongodb://biliob:123456@localhost:27017/biliob?authMechanism=SCRAM-SHA-256

spiders=(authorRedis videoRedis bangumiAndDonghua authorAutoAdd videoAutoAdd site online)
for var in ${spiders[@]}
do
    nohup scrapy crawl "$var" -L INFO 1>log/$var.log 2>&1 &
done
nohup python ./biliob_requests/tag_adder.py 1>log/tag_adder.log 2>&1 &
cd danmaku_spider/ && nohup scrapy crawl DanmakuAggregate 1>../log/log.log 2>&1 &

