#!/bin/bash
gcloud config set project $1
gcloud services enable deploymentmanager.googleapis.com
gcloud deployment-manager deployments delete byo-test --quiet &>/dev/null
gcloud deployment-manager deployments create byo-test --config byo.yml
cd .. && rm -fR test-cloud-shell-deployment
