#!/bin/sh
docker rm -f tiny-maven-proxy
docker run --name=tiny-maven-proxy -d -v /var/lib/maven:/mnt/media/maven -p 5956:5956 tiny-maven-proxy
