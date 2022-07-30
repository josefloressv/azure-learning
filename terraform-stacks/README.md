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


https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli#configuring-azure-cli-authentication-in-terraform