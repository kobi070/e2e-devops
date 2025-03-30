# E2E DevOps Project

This repository contains a complete end-to-end DevOps implementation showcasing infrastructure as code, containerization, monitoring, CI/CD pipelines, and Kubernetes orchestration.

## Project Overview

This project demonstrates a complete DevOps workflow for a Flask-based AWS monitoring application:

- **Infrastructure provisioning** with Terraform
- **Containerization** with Docker
- **Orchestration** with Kubernetes
- **CI/CD automation** using Jenkins and Azure Pipelines
- **AWS resource monitoring** with a Flask web application

## Cloud Architecture

<!-- ![AWS Architecture Diagram](./e2e-arc.png) -->

The diagram illustrates our AWS infrastructure setup:

1. **User Access**: Users connect to our application through an internet gateway.

2. **AWS Cloud Region (ap-east-1)**: Our entire infrastructure is hosted in the AWS Asia Pacific (Hong Kong) region.

3. **VPC Architecture**:

   - A default VPC contains our network infrastructure
   - The VPC is divided into two subnets:
     - **Public Subnet**: Accessible from the internet, containing resources that need external connectivity
     - **Private Subnet**: Protected internal network where our EC2 instance resides

4. **EC2 Instance**: Our main application server runs on an EC2 instance within the private subnet for enhanced security.

5. **Security Groups**:
   - **default_vpc_security_group**: Controls general traffic to the VPC
   - **ec2_security_group**: Specific rules for traffic reaching our EC2 instance
   - **bound internet traffic**: Manages outbound connections to the internet

This architecture provides a secure environment by placing our application server in a private subnet while still allowing controlled access through configured security groups and the public subnet.

## Repository Structure

- **docker/** - Docker configuration for the Flask application
  - Includes multi-stage Dockerfile and source code
- **flask-aws-monitor/** - AWS monitoring web application
  - Charts, templates, and configuration for monitoring AWS resources
- **k8s/** - Kubernetes deployment manifests
  - Deployment and service YAML files for running the application in Kubernetes
- **pipelines/** - CI/CD pipeline configurations
  - Jenkinsfile and Azure pipeline configuration for automation
- **terraform/** - Infrastructure as code
  - Terraform scripts to provision AWS resources (EC2, security groups, etc.)

## Prerequisites

To work with this project, you'll need:

- AWS account with appropriate credentials
- Docker installed locally
- Terraform installed locally
- Access to a Kubernetes cluster
- Jenkins or Azure DevOps for CI/CD

## Getting Started

### 1. Provision Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

This will create an EC2 instance with proper security groups and SSH access.

### 2. Build and Run the Docker Container

```bash
cd docker
docker build -t aws-monitor:latest .
docker run -itd -p 5001:5001 \
  -e AWS_ACCESS_KEY_ID=<your-key> \
  -e AWS_SECRET_ACCESS_KEY=<your-secret> \
  aws-monitor:latest
```

### 3. Deploy to Kubernetes

First, create a secret for AWS credentials:

```bash
kubectl create secret generic aws-secrets \
  --from-literal=AWS_ACCESS_KEY_ID=<your-key> \
  --from-literal=AWS_SECRET_ACCESS_KEY=<your-secret>
```

Then apply the Kubernetes manifests:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### 4. Set Up CI/CD Pipelines

#### Jenkins

- Configure a Jenkins pipeline pointing to the Jenkinsfile in this repository
- Ensure Jenkins has Docker and required plugins installed

#### Azure DevOps

- Connect your repository to Azure DevOps
- Create a pipeline using the azure-pipeline.yaml configuration
- Pipeline will automatically run on pushes to the dev branch

## Application Features

The Flask application provides visibility into AWS resources:

- EC2 instances monitoring
- Load balancer status
- VPC information
- AMI details

## Branching Strategy

This project follows Git Flow:

- `main` - Production-ready code
- `dev` - Development branch
- `feature/*` - Feature branches for individual components

## Security Note

This project requires AWS credentials to function. Always:

- Use environment variables for credentials
- Store sensitive information in Kubernetes secrets
- Never commit credentials to the repository
