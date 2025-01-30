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
  hostAliasEnabled: true #activate in case the domain set in serverName is not public
  env:
    serverName: "example.onesaitplatform.com"
	ipHost: "134.40.42.23" #IP of VM or cluster where the application is running and must be mapped to /etc/hosts file in order to access the platform
    ingressHostName: example.onesaitplatform.com
```

- Helm installation command:

```
helm install onesaitplatform/onesaitplatform-ce-base-chart \
               -f base-values.yml \
               --namespace <your_k8s_namespace> \
               --generate-name \
               --version 6.2.0-ce
```

After the installation of base chart, it is necessary to look for Administrator API Key and Platform Admin API Key and set them in Advanced Identity Manager values and change the value of ADMIN_API_KEY in ControlPanel deployment after installation. You can obtain them from configDB in onesaitplatform_master_config.master_user_token table.

```
mysql -u root -p

password: changeIt!

use onesaitplatform_master_config;
select * from master_user_token where master_user_id='administrator';
select * from master_user_token where master_user_id='platform_admin';
```

```
helm install onesaitplatform/onesaitplatform-ce-advidentitymng-chart \
               -f advidentitymng-values.yml \
               --namespace <your_k8s_namespace> \
               --generate-name \
               --version 6.2.0-ce
```

- The advanced identity manager values can be overwritten with the following:

```
global:
  limitsEnabled: false
  env:
    serverName: "example.onesaitplatform.com"
    platformAdminAPIKey: "0dfd700d66884fa9b7a1c2d1ddcc901d" #example of token, you have to set the generated token from your installation
    administratorAPIKey: "d4d173323edb49cb8df923182863fda5" #example of token, you have to set the generated token from your installation
```

```
kubectl patch deployment loadbalancer --patch "$(cat onesaitplatform-ce-advidentitymng-chart/conf-files/nginx-config-volumes.yaml)"
```

- In case you want to deploy engine/intelligence charts, the following instructions must be executed:

```
helm install onesaitplatform/onesaitplatform-ce-engine-chart \
               -f engine-values.yml \
               --namespace <your_k8s_namespace> \
               --generate-name \
               --version 6.2.0-ce
```

```
helm install onesaitplatform/onesaitplatform-ce-intelligence-chart \
               -f intelligence-values.yml \
               --namespace <your_k8s_namespace> \
               --generate-name \
               --version 6.2.0-ce
```

- The engine/intelligence values can be overwritten with the following:

```
global:
  groupName: onesait-platform
  storageClassName: managed-premium
  storageClassProvisioned: false
  localStorageEnabled: false
  env:
    serverName: "example.onesaitplatform.com"
    avdIdentityMngAPIKey: "d4d173323edb49cb8df923182863fda5" #example of token, you have to set the generated token from your installation
```

- In order to access the modules included in engine/intelligence charts through loadbalancer, you should patch the loadbalancer deployment. This action can be done with the kubectl command:

```
kubectl patch deployment loadbalancer --patch "$(cat onesaitplatform-ce-engine-chart/conf-files/nginx-config-volumes.yaml)"
kubectl patch deployment loadbalancer --patch "$(cat onesaitplatform-ce-intelligence-chart/conf-files/nginx-config-volumes.yaml)"
```

- There is also a plugin designed for this feature:

### Plugin installation

```
> helm plugin install https://github.com/onesaitplatform/patch-lb-helmplugin.git
```

### Uninstall

```
> helm plugin uninstall addconfig
```

### List plugins

```
> helm plugin list
```

### Plugin usage:

```
> helm addconfig --module <module_name>

or

> helm addconfig --module <module_name> + install platform_chart

where module_name can take one of these values:

  - base (it is not necessary to be executed)
  - identity
  - intelligence
  - engine
```
## Control Panel access

You can access with these users/passwords:

 - administrator/Community2019! 
 - developer/Community2019! 
 - analytics/Community2019!
