#!/bin/bash
export BILIOB_REDIS_CONNECTION_STRING=redis://:123456@127.0.0.1:6379
export BILIOB_MONGO_URL=mongodb://biliob:123456@localhost:27017

tasks=(start_scheduler.py)

for var in ${tasks[@]} 
do 
    ps -ef | grep $var | grep -v grep | cut -c 9-15 | xargs kill -9 
    nohup python $var 1> log/$var.log 2>&1 &
done 
