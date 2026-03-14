# Task C: Nginx Deployment via Helm

This project demonstrates a automated deployment of a standard Nginx web application to a Kubernetes cluster using **Helm v3**. It utilizes a customized Helm chart to manage the application lifecycle, service discovery, and external routing.

## 🏗 Architecture Overview

The deployment follows a standard Kubernetes web-traffic pattern:

1. **Ingress**: Routes external traffic based on the hostname `nginx.local`.
2. **Service**: A `ClusterIP` service that provides a stable internal endpoint.
3. **Deployment**: Manages a specified number of Nginx Pods (Replicas).



## 🛠 Prerequisites

- **Kubernetes Cluster**: (Docker Desktop, Minikube, or Kind)
- **Helm**: v3.x installed
- **Ingress Controller**: (e.g., ingress-nginx) installed in the cluster

## 🚀 Deployment Instructions

### 1. Install the Chart
From the root directory, run:
```powershell
helm install web-server ./my-nginx-app