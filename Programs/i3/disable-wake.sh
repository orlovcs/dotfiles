#!/bin/bash
for i in $(seq 1 12)
do
	timeout 1s /usr/bin/acpitool -W $i
	echo "disabling next trigger"
done
