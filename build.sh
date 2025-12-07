#!/bin/bash
set -e
ART_USER="amitajoshi1992@gmail.com"
ART_API_KEY=$1
ART_URL="https://trialcpnyac.jfrog.io/artifactory"
REPO="CAT"
mvn clean install -DskipTests=true

app_name=$(xmllint --xpath "/*[local-name()='project']/*[local-name()='artifactId']/text()" pom.xml)
version=$(xmllint --xpath "/*[local-name()='project']/*[local-name()='version']/text()" pom.xml)
JAR_FILE="target/${app_name}-${version}.jar"
echo "App Name: $app_name"
echo "Version: $version"
echo "JAR_FILE $JAR_FILE"
docker build -t "$app_name:$version" .
docker tag "$app_name:$version" "trialcpnyac.jfrog.io/cat-docker/$app_name:$version"
docker push "trialcpnyac.jfrog.io/cat-docker/$app_name:$version"
zip -r manifestbuild.zip manifestbuild/

curl -u "${ART_USER}:${ART_API_KEY}" -T "${JAR_FILE}" "${ART_URL}/${REPO}/${app_name}/${version}/${app_name}-${version}.jar"

curl -u "${ART_USER}:${ART_API_KEY}" -T manifestbuild.zip "${ART_URL}/${REPO}/${app_name}/${version}/manifestbuild.zip"

echo "uploaded ${JAR_FILE} and manifestbuild.zip to ${ART_URL}/${REPO}/${app_name}/${version}/"

#to uoload helm chart to helm repo in Jfrog
tar -cvzf manifestbuild.tgz manifestbuild/
helm push manifestbuild.tgz oci://trialcpnyac.jfrog.io/cat-service-helm