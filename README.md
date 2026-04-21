# Metrics setup of dreams

This is my best approach for monitoring and observability tools in a Kubernetes cluster! :)

*Still in development! I hope some day it will be finished (and I hope to have RAM memory enough).*

Repo: https://github.com/ViniciusPilan/metrics-setup-of-dreams
---

# Architecture

## v0

A version of the cluster setup where we can monitore the cluster health and behavior using metrics (nodes, workloads, etc.), using the minimal tools for that.

Useful to understand bottle necks at a infrastructure level (resource utilization).

This setup is focused on observality in the present time, not focusing on metrics retention for long periods.

---

## To do
### Tools (check list to do)
#### Cluster
- [x] ArgoCD 
- [x] Poppeye
- [ ] NGINX
- [x] Garage
- [x] Srimzi
- [ ] GatewayAPI
- [ ] Ferramenta de Container Image Registry pra cache interno de imagens de container
- [ ] Imageswap
 
#### Monitoring and Observability
- [x] Prometheus Operator
- [x] Prometheus
- [x] Node exporter
- [x] Grafana
- [x] KubeStateMetrics
- [ ] Alertmanager
- [x] Mimir
    - [x] Kafka
    - [x] Kafka Exporter
- [ ] Loki
- [x] PushGateway
- [ ] BlackBox Exporter
- [ ] Dashboards
    - [ ] Prometheus
    - [ ] Node exporter
    - [x] Mimir
    - [ ] Popeye
    - [ ] Grafana
    - [ ] BlackBox Exporter

#### App
- [ ] NGINX

### Next steps
1. Loki
2. Gateway API
3. NGINX
4. BlackBox exporter 
5. Dashboards
6. Alertmanager
7. Ferramenta de Container Image Registry pra cache interno de imagens de container
8. Imageswap
