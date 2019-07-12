#!/bin/bash
# gcloud config set project $1
# gcloud services enable cloudresourcemanager.googleapis.com
# gcloud services enable deploymentmanager.googleapis.com
# gcloud deployment-manager deployments delete byo-test --quiet &>/dev/null
# gcloud deployment-manager deployments create byo-test --config byo.yml
gcloud projects add-iam-policy-binding $1 --member=serviceAccount:frame-stage@frame-customer-iaas-stage.iam.gserviceaccount.com --role=roles/compute.instanceAdmin
gcloud projects add-iam-policy-binding $1 --member=serviceAccount:frame-stage@frame-customer-iaas-stage.iam.gserviceaccount.com --role=roles/compute.networkAdmin
gcloud projects add-iam-policy-binding $1 --member=serviceAccount:frame-stage@frame-customer-iaas-stage.iam.gserviceaccount.com --role=roles/compute.securityAdmin
gcloud projects add-iam-policy-binding $1 --member=serviceAccount:frame-stage@frame-customer-iaas-stage.iam.gserviceaccount.com --role=roles/compute.storageAdmin
gcloud projects add-iam-policy-binding $1 --member=serviceAccount:frame-stage@frame-customer-iaas-stage.iam.gserviceaccount.com --role=roles/dns.admin
cd .. && rm -fR test-cloud-shell-deployment
