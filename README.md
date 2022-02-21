# ui5-deploy
This action simplifies the deployment of UI5 applications to different SAP Environments ( [SAP BTP](https://help.sap.com/viewer/product/BTP/Cloud/en-US) & [SAP ABAP](https://help.sap.com/viewer/product/SAP_NETWEAVER/ALL/en-US) ). 

# Prerequisites

This action works seamlessly with projects that use `ui5-tooling`.
Your application should maintain configuration files for respective cloud or ABAP environments. 

`.ui5deployrc` for BSP ( [Sample file](https://github.com/integrtr/ui5-boilerplate/blob/basic-deployment-setup/.ui5deployrc) )
```
{
  "cwd": "./dist",
  "files": "**/*.*",
  "client": "100",
  "useStrictSSL": false,
  "language": "EN",
  "package": "ZUI5_DEPLOY",
  "bspContainer": "ZUI5BP",
  "bspContainerText": "Boilerplate",
  "transportNo": "ACDK901302",
  "createTransport": false,
  "transportText": "Test Transport",
  "transportUseLocked": false,
  "transportUseUserMatch": false,
  "calculateApplicationIndex": true
}
```
`mta.yaml` ( [Sample file](https://github.com/integrtr/ui5-boilerplate/blob/master/mta.yaml) )
```
_schema-version: '2.0.0'
ID: 'ui5boilerplate'
version: 1.0.0

parameters:
  hcp-deployer-version: '1.0.0'

modules:
  - name: 'ui5boilerplate'
    type: com.sap.fiori.app
    path: ./dist
    parameters:
      html5-app-name: 'ui5boilerplate'
      html5-app-display-name: 'ui5boilerplate'
      minimum-sapui5-version: 1.44.10
      html5-app-version: 1.0.0-${timestamp}
```

# Usage 

**SAP ABAP** environment
```
steps:
  - name: Deploying Project
  - uses: integrtr/ui5-deploy@master
    with:
      type: 'bsp'
      user: ${{ secrets.ABAP_USER }}
      password: ${{ secrets.ABAP_PASSWORD }}
      host: ${{ secrets.ABAP_HOST }}
```

**SAP BTP** environment 
```
steps:
  - name: Deploying Project
  - uses: integrtr/ui5-deploy@master
    with:
      type: 'neo'
      user: ${{ secrets.NEO_USER }}
      password: ${{ secrets.NEO_PASSWORD }}
      host: ${{ secrets.NEO_HOST }}
      sub-account-id: ${{ secrets.NEO_ACCOUNT }}
```

# Inputs
* `type`: (Required) Specifies environment choice (`neo` or `bsp`)

* `user` : (Required) Login username for environment specified in `type` 

* `password` : (Required) Login password for environment specified in `type`

* `host` : (Required) Hostname for environment specified in `type`  (Example: `eu2.hana.ondemand.com` or `https://sapdev.acme.com:8443/`)

* `sub-account-id` : (Optional) Technical name for your BTP sub-account (Example: 'jrqll30d0f' )


# Configuration & Authorization

Connectivity details to the `bsp` and `neo` environments have been specified as [GitHub Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) in the usage for security best practices. Kindly maintain them for your repository as per your environment selection:

* **SAP ABAP Environment** (`bsp`)
  * ABAP_USER
  * ABAP_PASSWORD
  * ABAP_HOST
  
* **SAP BTP Environment** (`neo`)
  * NEO_USER
  * NEO_PASSWORD
  * NEO_HOST
  * NEO_ACCOUNT


# Credits
* [TheVivekGowda](https://github.com/TheVivekGowda)
* [nitish-mehta](https://github.com/nitish-mehta)
* [ui5-nwabap-deployer](https://github.com/pfefferf/ui5-nwabap-deployer/blob/master/packages/ui5-nwabap-deployer-cli/README.md) by [pfefferf](https://github.com/pfefferf)

# Got feedback/ Need Support? 
Feel free to reach out on support@integrtr.com or open new issues for feature requests, bugs or general feedback for this project. 


