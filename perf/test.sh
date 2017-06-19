#!/bin/bash

# wait long enough for site to start
sleep 3
url="http://web"
for i in {1..5}; do
    curl -w "@/perf/curl-format.txt" -o /dev/null -s $url
done