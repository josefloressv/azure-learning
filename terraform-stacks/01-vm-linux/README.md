# Azure Linux Virtual Machine
Resources
* [linux_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine)
* [network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)
* [subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)
* [public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)
* [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)

Information on available virtual machine images.
https://docs.microsoft.com/en-us/cli/azure/vm/image?view=azure-cli-latest
```bash

```

## How to run
```bash
az login
terraform init -reconfigure
#
# to avoid the error from ACG Azure Sandbox restriction:
# Cannnot register providers: Microsoft.DesktopVirtualization, Microsoft.AVS, Microsoft.StoragePool, Microsoft.DataProtection
# Microsoft.AppPlatform, Microsoft.Maintenance. Errors were: Cannot register provider Microsoft.DesktopVirtualization with
# Azure Resource Manager: resources.ProvidersClient#Register: Failure responding to request: StatusCode=403 
# 
export ARM_SKIP_PROVIDER_REGISTRATION=true
terraform plan -out plan.tfplan
terraform apply plan.tfplan
```

## How to Connect

```bash
ssh adminuser@#ip_address_generated
```
