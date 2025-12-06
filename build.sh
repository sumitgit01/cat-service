#!/bin/bash

DOCKER_REGISTRY="trialcpnyac.jfrog.io"
USERNAME="amitajoshi1992@gmail.com"
PASSWORD="YW1pdGFqb3NoaTE5OTJAZ21haWwuY29tOmNtVm1kR3R1T2pBeE9qRTNPVFkxTlRZMk5EZzZSV1JvVkhFMFZtaEVhbEJNUmtWSFdrazBZMWhVY0VOQlFtczU="

echo "$PASSWORD" | docker login "$DOCKER_REGISTRY" -u "$USERNAME" --password-stdin

app_name=$(xmllint --xpath "/[local-name()='project']/[local-name()='artifactId']/text()" pom.xml)

version=$(xmllint --xpath "/[local-name()='project']/[local-name()='version']/text()" pom.xml)
docker build -t $app_name:$version .
docker tag $app_name:$version trialcpnyac.jfrog.io/cat-docker/$app_name:$version
docker push trialcpnyac.jfrog.io/cat-docker/$app_name:$version