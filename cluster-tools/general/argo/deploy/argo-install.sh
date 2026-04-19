#!/bin/bash

kubectl create ns argocd

kubectl create -f argo/install.yaml -n argocd

kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd | yq .data.password | base64 --decode

kubectl port-forward -n argocd svc/argocd-server 8080:80
