#!/bin/sh
docker build -f Dockerfile.proxy -t tiny-maven-proxy .
docker build -f Dockerfile.indexer -t tiny-maven-indexer .
