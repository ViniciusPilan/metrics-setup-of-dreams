#!/bin/bash


kind create cluster --config=cluster.yaml

bash ../cluster-tools/general/argo/deploy/argo-install.sh

bash helper.sh
