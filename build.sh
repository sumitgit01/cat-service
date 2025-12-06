#!/bin/bash

app_name=$(xmllint --xpath "/[local-name()='project']/[local-name()='artifactId']/text()" pom.xml)

version=$(xmllint --xpath "/[local-name()='project']/[local-name()='version']/text()" pom.xml)
docker build -t $app_name:$version .
docker tag $app_name:$version trialcpnyac.jfrog.io/cat-docker/$app_name:$version
docker push trialcpnyac.jfrog.io/cat-docker/$app_name:$version