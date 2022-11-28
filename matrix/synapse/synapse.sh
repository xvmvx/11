#!/bin/bash
mkdir -p synapse/logs
mkdir synapse/media_store
mkdir synapse/uploads
each "docker run --rm \
	-v `pwd`/synapse:/data \
	-e SYNAPSE_SERVER_NAME=修改为你的网址 \
	-e SYNAPSE_REPORT_STATS=no \
	matrixdotorg/synapse:latest generate
"
