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

- After the installation of base chart, it is necessary to look for Administrator API Key and Platform Admin API Key and set them in Advanced Identity Manager values and change the value of ADMIN_API_KEY in ControlPanel deployment after installation. You can obtain them from configDB in onesaitplatform_master_config.master_user_token table.

```
mysql -u root -p

password: changeIt!

use onesaitplatform_master_config;
select * from master_user_token where master_user_id='administrator';
select * from master_user_token where master_user_id='platform_admin';
```

- You can override default chart values with the following, saving it as a file with yaml extension and passing it to the chart execution with -f flag. 

```
global:
  env:
    serverName: "example.onesaitplatform.com"
    platformAdminAPIKey: "0dfd700d66884fa9b7a1c2d1ddcc901d" 
    administratorAPIKey: "d4d173323edb49cb8df923182863fda5"
```

- Helm installation command:

```
helm install onesaitplatform/onesaitplatform-ce-advidentitymng-chart \
               -f advidentitymng-values.yml \
               --namespace <your_k8s_namespace> \
               --generate-name \
               --version 6.0.0-ce
```

- In order to access the modules included in advanced identity manager chart through loadbalancer, you should patch the loadbalancer deployment. This action can be done with the kubectl command:

```
kubectl patch deployment loadbalancer --patch "$(cat onesaitplatform-ce-advidentitymng-chart/conf-files/nginx-config-volumes.yaml)"
```

- There is also a plugin designed for this feature:

### Plugin installation

```
> helm plugin install https://github.com/onesaitplatform/patch-lb-helmplugin.git
```

### Plugin usage:

```
> helm addconfig --module identity
