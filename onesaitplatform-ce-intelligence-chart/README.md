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

- You can override default chart values with the following, saving it as a file with yaml extension and passing it to the chart execution with -f flag.

```
global:
  storageClassName: managed-premium
  storageClassProvisioned: false
  logStorageClassName: Azurefile
  localStorageEnabled: false
  env:
    serverName: "example.onesaitplatform.com"
```

- Helm installation command:

```
helm install onesaitplatform/onesaitplatform-ce-intelligence-chart \
               -f intelligence-values.yml \
               --namespace <your_k8s_namespace> \
               --generate-name \
               --version 5.2.0-ce
```
- For adding the modules included in engine/intelligence charts, you should patch the loadbalancer deployment. This action can be done with the kubectl command:

```
kubectl patch deployment loadbalancer --patch "$(cat onesaitplatform-ce-intelligence-chart/conf-files/nginx-config-volumes.yaml)"
```

- There is also a plugin designed for this feature:

### Plugin installation

```
> helm plugin install https://github.com/onesaitplatform/patch-lb-helmplugin.git
```

### Plugin usage:

```
> helm addconfig --module intelligence