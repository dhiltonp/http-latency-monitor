#!/bin/bash

if [[ -z "$2" ]]; then
    echo "example: ./service-mon.sh www.google.com 15"
    echo " this will poll www.google.com every 15 seconds,"
    echo " writing logs to www.google.com.log"
    exit
fi

site=$1
delay=$2

log=$site.log

echo monitoring $site with a delay of $delay seconds

while :
do
    curl --max-redirs 10 -w "summary: %{content_type}, %{http_code}, %{http_connect}, %{local_ip}, %{local_port}, %{num_connects}, %{num_redirects}, %{remote_ip}, %{remote_port}, %{size_download}, %{size_header}, %{size_request}, %{size_upload}, %{speed_download}, %{speed_upload}, %{time_appconnect}, %{time_connect}, %{time_namelookup}, %{time_pretransfer}, %{time_redirect}, %{time_starttransfer}, %{time_total}, " --output /dev/null http://$site |& tr '\r' '\n' >> $log # curl download test
    echo -n "$site, " >> $log            # append site to csv line 
    date +%s >> $log                  # append unixtime to csv line
    sleep $delay                      # wait a little bit
done

