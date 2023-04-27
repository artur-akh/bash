#!/bin/bash
tmpfile=tempfile
BYTES=1M
COUNT=1024

/sbin/sysctl -w vm.drop_caches=3

echo "Write to Hdd"
sync; dd if=/dev/zero of=$tmpfile bs=$BYTES count=$COUNT; sync

echo "Read from Hdd"
dd if=$tmpfile of=/dev/null bs=$BYTES count=$COUNT

rm -f $tmpfile
