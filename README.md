http-latency-monitor
====================

simple scripts to help diagnose internet connectivity issues I have noticed with google fiber in provo.

usage
=====

these two scripts will monitor http connection latency using curl.

to use, run 'nohup ./sites-monitor.sh' in this directory (nohup if you
plan on closing the window, but want the script to continue to run).

to terminate, run 'killall -9 site-monitor.sh'

output
======

for each site in 'sites', a file is generated.

the most usable data is probably the 'summary' line, which can easily
be selected using something like 'grep ^summary *'. Most of the fields
correspond to the curl -w options, but the site and unix timestamp
have also been appended to the line:

summary: content_type, http_code, http_connect, local_ip,
local_port, num_connects, num_redirects, remote_ip, 
remote_port, size_download, size_header, size_request, 
size_upload, speed_download, speed_upload,time_appconnect,
time_connect, time_namelookup, time_pretransfer, time_redirect,
time_starttransfer, time_total, site, unix_timestamp

for more detail on these fields, use 'man curl'.


David Hilton <dhiltonp@gmail.com>
