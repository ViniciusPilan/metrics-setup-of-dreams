#!/bin/bash

cd "$(dirname "$0")"

echo "########## Creating 'argocd' namespace ##########"
kubectl create ns argocd

echo "########## Installing argo files ##########"
kubectl create -f install.yaml -n argocd

echo "########## Waiting argo server be ready ##########"
kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=120s

echo "########## Creating the ArgoCD Applications ##########"
kubectl apply -f ./all-apps.yaml

password=$(kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd | yq .data.password | base64 --decode)

echo "========================================================================="
echo "Access ArgoCD server use these credentials:"
echo "- user: admin"
echo "- password: ${password}"
echo "URL to access: http://localhost:8080"
echo "Please, use the credentials when accessing 'http://localhost:8080'"
echo "========================================================================="
kubectl port-forward -n argocd svc/argocd-server 8080:80
