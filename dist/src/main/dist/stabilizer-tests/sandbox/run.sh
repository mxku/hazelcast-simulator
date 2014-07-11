#!/bin/sh

provisioner --scale 2
provisioner --restart

for i in {1..1}
do
coordinator --memberWorkerCount 2 \
	--clientWorkerCount 2 \
	--duration 1m \
	--parallel \
	test.properties
done

provisioner --download
provisioner --clean

echo "The End"