# Exam Application Kubernetes Deployment

This repository contains Kubernetes configuration files for deploying the Exam application.

## Repository Structure

- `k8s/` - Kubernetes configuration files
  - `deployment.yaml` - Deployment configuration for the application
  - `service.yaml` - Service configuration to expose the application

## Deployment

The application is deployed using a Kubernetes Deployment and exposed via a LoadBalancer Service.

### Prerequisites

- Kubernetes cluster 
- `kubectl` configured to communicate with your cluster
- AWS credentials (stored in a Kubernetes secret)

### Creating the AWS Credentials Secret

Before applying the deployment, create a Kubernetes secret with your AWS credentials:

```bash
kubectl create secret generic aws-secrets \
  --from-literal=AWS_ACCESS_KEY_ID=your-access-key \
  --from-literal=AWS_SECRET_ACCESS_KEY=your-secret-key
```

### Deploying the Application

Apply the Kubernetes configurations:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### Verifying the Deployment

Check if the pods are running:

```bash
kubectl get pods -l app=exam
```

Check the service:

```bash
kubectl get svc exam-service
```

## Application Details

- The application runs on container port 5001
- The service exposes port 80 externally
- The application uses the image `kobi070/exam:latest`
- AWS credentials are required for the application to function

## Cleanup

To remove the deployment:

```bash
kubectl delete -f k8s/service.yaml
kubectl delete -f k8s/deployment.yaml
```