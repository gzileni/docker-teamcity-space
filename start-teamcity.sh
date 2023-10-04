#!/bin/bash

docker run --name teamcity-server-gz -v ./teamcity/docker/data:/data/teamcity_server/datadir -v ./teamcity/docker/logs:/opt/teamcity/logs -p 8111:8111 jetbrains/teamcity-server