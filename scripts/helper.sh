#!/bin/bash

argo_admin_password=$(kubectl get secrets -n argocd argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d)
grafana_user=$(kubectl get secrets grafana -n cluster-general-tools -o jsonpath='{.data.admin-user}' | base64 -d)
grafana_password=$(kubectl get secrets grafana -n cluster-general-tools -o jsonpath='{.data.admin-password}' | base64 -d)


echo "========================================================================="
echo "# ARGOCD"
echo "Access ArgoCD server using these credentials:"
echo " - user: admin"
echo " - password: ${argo_admin_password}"
echo "Command: 'kubectl port-forward -n argocd svc/argocd-server 8080:80'"
echo "URL to access: http://localhost:8080"
echo "Please, use the credentials when accessing 'http://localhost:8080'"
echo "========================================================================="

echo "========================================================================="
echo "# Prometheus"
echo "Access Prometheus web ui server:"
echo "Command: 'kubectl port-forward -n metrics svc/prometheus-prometheus 9090'"
echo "URL to access: http://localhost:9090"
echo "========================================================================="

echo "========================================================================="
echo "# Grafana"
echo "Access Grafana Web UI using these credentials:"
echo " - user: $grafana_user"
echo " - password: $grafana_password"
echo "Command: 'kubectl port-forward -n cluster-general-tools svc/grafana 8081:80'"
echo "URL to access: http://localhost:8081"
echo "Please, use the credentials when accessing 'http://localhost:8081'"
echo "========================================================================="
