#!/bin/bash
gcloud deployment-manager deployments delete byo-test --quiet &>/dev/null
gcloud deployment-manager deployments create byo-test --config byo.yml --project $1
gcloud iam service-accounts keys create ../byo_creds.json --iam-account=frame-byo-workload@$1.iam.gserviceaccount.com
cloudshell download-file byo_creds.json
