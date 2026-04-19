#!/bin/bash


kind create cluster --config=cluster.yaml

kubectl create ns cluster-general-tools

bash cluster-tools/general/argo/deploy/argo-install.sh
