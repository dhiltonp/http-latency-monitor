#!/bin/bash

for site in `cat sites`; do
    ./site-monitor.sh $site 60 &
done

sleep .5s
