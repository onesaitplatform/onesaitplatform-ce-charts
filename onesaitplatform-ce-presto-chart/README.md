[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/onesaitplatformhelmchart)](https://artifacthub.io/packages/search?repo=onesaitplatformhelmchart)

### Onesait Platform Helm chart

- Requirements:

  - Helm v3 installed

## How to install the Chart

```
helm repo add onesaitplatform https://helm.onesaitplatform.com/
helm repo update
```

## How to deploy Onesait Platform chart on k8s/ocp existing cluster

- You can override default chart values with the following, saving it as a file with yaml extension and passing it to the chart execution with -f flag. You will need to obtain Administrator API Key from advanced identity manager chart installation.

```
global:
  storageClassName: managed-premium
  localStorageEnabled: false
```

- Helm installation command:

```
helm install onesaitplatform/onesaitplatform-ce-presto-chart \
               -f presto-values.yml \
               --namespace <your_k8s_namespace> \
               --generate-name \
               --version 6.3.0-ce
```
- In order to access the modules included in presto chart through loadbalancer, you should patch the loadbalancer deployment. This action can be done with the kubectl command:

```
kubectl patch deployment loadbalancer --patch "$(cat onesaitplatform-ce-presto-chart/conf-files/nginx-config-volumes.yaml)"
```