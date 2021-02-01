## How to build this operator

- In order to deploy every chart you can do it manually:

  - First, validating chart sintax:

    ```
    > helm lint ./name-of-the-chart
    ```

  - Then, packaging this chart:

    ```
    > helm package ./name-of-the-chart
    ```

  - And finally pushing it to chart museum repository:

    ```
    > helm push name-of-the-chart.tgz onesaitplatform --username admin --password 0n3s41t-2020!
    ```

- Additionally, you can use this script, it needs the name of the chart as an argument:

  ```
  > ./chartpublisher.sh base
  > ./chartpublisher.sh opendata
  > ./chartpublisher.sh intelligence
  > ./chartpublisher.sh api
  > ./chartpublisher.sh engine
  > ./chartpublisher.sh tools
  > ./chartpublisher.sh things
  > ./chartpublisher.sh log
  > ./chartpublisher.sh all (WARNING! publish all Platform chart with the same version)
  ```

## How to deploy every chart on k8s/ocp existing cluster

- Onesait Platform Base Chart:

```
helm install onesaitplatform/onesaitplatform-base-chart \
               -f testing-values/base-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3
```

- Onesait Platform Open Data Chart:

```
helm install onesaitplatform/onesaitplatform-opendata-chart \
               -f testing-values/opendata-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

with patch config plugin:

helm addconfig --module opendata install onesaitplatform/onesaitplatform-opendata-chart \
               -f testing-values/opendata-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

```

- Onesait Platform Advanced API Manager Chart:

```
helm install onesaitplatform/onesaitplatform-advapimng-chart \
               -f testing-values/advapi-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

with patch config plugin:

helm addconfig --module api install onesaitplatform/onesaitplatform-advapimng-chart \
               -f testing-values/advapi-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

```

- Onesait Platform Intelligence Chart:

```
helm install onesaitplatform/onesaitplatform-intelligence-chart \
               -f testing-values/intelligence-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

with patch config plugin:

helm addconfig --module intelligence install onesaitplatform/onesaitplatform-intelligence-chart \
               -f testing-values/intelligence-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

```

- Onesait Platform Engine Chart:

```
helm install onesaitplatform/onesaitplatform-engine-chart \
               -f testing-values/engine-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

with patch config plugin:

helm addconfig --module engine install onesaitplatform/onesaitplatform-engine-chart \
               -f testing-values/engine-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3            

```

- Onesait Platform Business Tools Chart:

```
helm install onesaitplatform/onesaitplatform-bsnstools-chart \
               -f testing-values/bsnstools-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

with patch config plugin:

helm addconfig --module tools install onesaitplatform/onesaitplatform-bsnstools-chart \
               -f testing-values/bsnstools-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3               
```

- Onesait Platform Things Chart:

```
helm install onesaitplatform/onesaitplatform-things-chart \
               -f testing-values/things-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

with patch config plugin:

helm addconfig --module things install onesaitplatform/onesaitplatform-things-chart \
               -f testing-values/things-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3              
```

- Onesait Platform Centralized Log Chart:

```
helm install onesaitplatform/onesaitplatform-centralizedlog-chart \
               -f testing-values/log-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3

with patch config plugin:

helm addconfig --module log install onesaitplatform/onesaitplatform-centralizedlog-chart \
               -f testing-values/log-values.yml \
               --namespace onesaitplatform-demo \
               --generate-name \
               --version 3
```
