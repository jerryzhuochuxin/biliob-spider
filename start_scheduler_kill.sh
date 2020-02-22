#!/bin/bash
tasks=(start_scheduler.py)
for var in ${tasks[@]}
do
    ps -ef | grep $var | grep -v grep | awk '{print $2}' | xargs kill -9
done
