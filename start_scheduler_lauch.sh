#!/bin/bash
export BILIOB_REDIS_CONNECTION_STRING=redis://:123456@127.0.0.1:6379
# shellcheck disable=SC2125
export BILIOB_MONGO_URL=mongodb://biliob:123456@localhost:27017/biliob?authMechanism=SCRAM-SHA-256

tasks=(start_scheduler.py)
for var in ${tasks[@]}
do
    nohup python3 $var 1> log/$var.log 2>&1 &
done
