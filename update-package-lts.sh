#!/bin/bash

# Expecting two arguments: dockerVersion and nodejsOrgVersion
dockerVersion="$1"
nodejsOrgVersion="$2"

# Use jq to update package.json with the provided versions
jq --arg dockerVersion "$dockerVersion" \
   --arg nodejsOrgVersion "$nodejsOrgVersion" \
   '.lts.docker = $dockerVersion | .lts["nodejs.org"] = $nodejsOrgVersion' package.json > package.json.tmp && mv package.json.tmp package.json
