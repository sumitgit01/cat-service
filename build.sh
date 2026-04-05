#!/bin/bash
set -e

# Accept Nexus URL from Jenkins (e.g., 192.168.68.124:8083)
NEXUS_URL=$1
REPO_NAME=$2
# Get info from pom.xml
APP_NAME=$(mvn help:evaluate -Dexpression=project.artifactId -q -DforceStdout)
VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

echo "Processing Backend: $APP_NAME on Registry: $NEXUS_URL"
echo "--- Repo: $REPO_NAME ---"

docker build -t "$APP_NAME:$VERSION" .

# Tagging
docker tag "$APP_NAME:$VERSION" "$NEXUS_URL/$APP_NAME:$VERSION"
docker tag "$APP_NAME:$VERSION" "$NEXUS_URL/$APP_NAME:latest"

# Push
docker push "$NEXUS_URL/$APP_NAME:$VERSION"
docker push "$NEXUS_URL/$APP_NAME:latest"