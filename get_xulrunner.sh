#!/bin/bash
xr_root="http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/"
xr_version=`curl -s \
    $xr_root \
    | grep -e  "[0-9][0-9]\.[0-9]" \
    | grep -ve "[0-9][0-9]\.0b[0-9]\+" \
    | sed 's/<[^>]*>/ /g' \
    | awk '{print $1}' \
    | sort -d \
    | tail -1 \
    | sed 's/\/$//g'`

rm -rf XUL.framework
echo "Fetching $xr_root$xr_version/runtimes/xulrunner-$xr_version.en-US.mac.tar.bz2"
curl "$xr_root$xr_version/runtimes/xulrunner-$xr_version.en-US.mac.tar.bz2" \
    | tar xj
