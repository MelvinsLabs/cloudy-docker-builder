#!/bin/bash

echo "Starting WS" >> docker-container-startup.log

java -jar ${service.artifactId}.jar
