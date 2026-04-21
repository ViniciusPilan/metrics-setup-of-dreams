#!/bin/bash

# Refs: https://argo-cd.readthedocs.io/en/stable/operator-manual/installation/

cd "$(dirname "$0")"

echo "########## Creating 'argocd' namespace ##########"
kubectl create ns argocd

echo "########## Installing argo files ##########"
kubectl create -f install.yaml -n argocd

echo "########## Waiting argo server be ready ##########"
kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=120s

echo "########## Creating the ArgoCD Applications ##########"
kubectl apply -f ./all-apps.yaml
