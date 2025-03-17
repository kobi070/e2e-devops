# Exam Helm Chart

This chart deploys the Exam app to Kubernetes clusters.

## Setup

Before installing, create the AWS credentials secret:

```bash
kubectl create secret generic aws-secrets \
  --from-literal=AWS_ACCESS_KEY_ID=your-key \
  --from-literal=AWS_SECRET_ACCESS_KEY=your-secret
```

Install:

```bash
helm install my-release ./exam-chart
```


## Usage

Scale:
```bash
helm upgrade my-release ./exam-chart --set replicaCount=3
```

Change service:
```bash
helm upgrade my-release ./exam-chart --set service.type=ClusterIP
```

Environment variables:
```bash
helm upgrade my-release ./exam-chart --set extraEnv[0].name=DEBUG,extraEnv[0].value=true
```

## Removal

```bash
helm uninstall my-release
```

## Structure

```
exam-chart/
├── Chart.yaml
├── templates/
│   ├── deployment.yaml
│   └── service.yaml
└── values.yaml
```

## Notes

- Uses `aws-secrets` for credentials
- Consider using specific tags for production
- Remember to set resource limits for prod

## Troubleshooting

Check pods:
```bash
kubectl get pods -l app=exam
```

Check service:
```bash
kubectl get svc -l app=exam
```

Logs:
```bash
kubectl logs -l app=exam
```
