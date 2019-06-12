#!/bin/bash
gcloud deployment-manager deployments delete byo-test --quiet &>/dev/null
gcloud deployment-manager deployments create byo-test --config byo.yml --project $1
cd .. && rm -fR test-cloud-shell-deployment
