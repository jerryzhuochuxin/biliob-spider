#!/bin/bash
tasks=(start_scheduler.py)
for var in ${tasks[@]}
do
    nohup python3 $var 1> log/$var.log 2>&1 &
done
