#!/bin/bash

user=$(kubectl get secrets grafana -n metrics -o yaml | yq .data.admin-user | base64 -d)
password=$(kubectl get secrets grafana -n metrics -o yaml | yq .data.admin-password | base64 -d)

echo "Use these credentials to access grafana"
echo " - user: $user"
echo " - password: $password"
echo "Access http://localhost:8081 and use these credentials to access the Grafana Web UI"

kubectl port-forward -n metrics svc/grafana 8081:80
