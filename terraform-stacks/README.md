# Azure Terraform Stacks

## Azure Provider
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli

### Authenticate using Azure CLI
Login into Azure CLI:
```bash
az login
```

List the subscriptions:
```bash
az account list
```

Set the default subscription:
```bash
az account set --subscription="SUBSCRIPTION_ID"
```

Show list of subscriptions a see the default
```bash
az account list -o table

Name                           CloudName    SubscriptionId                        State    IsDefault
-----------------------------  -----------  ------------------------------------  -------  -----------
DI_NA_Terraform_Workshops_001  AzureCloud   d215b014-xxxxx-4e2a-8951-cdaae53d377c  Enabled  False
Azure subscription 1           AzureCloud   c791bc0b-xxxxx-4b6d-a684-c7ca19db1a73  Enabled  False
P3-Real Hands-On Labs          AzureCloud   0f39574d-xxxxx-48cf-b622-0e27a6943bd2  Enabled  True
```


https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli#configuring-azure-cli-authentication-in-terraform