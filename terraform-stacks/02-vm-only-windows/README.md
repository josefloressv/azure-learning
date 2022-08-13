# Azure Windows Virtual Machine
Resources
* [azurerm_windows_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine)
* [network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)
* [subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)
* [public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)

Information on available virtual machine images.
https://docs.microsoft.com/en-us/cli/azure/vm/image?view=azure-cli-latest

```bash
az vm image list --publisher MicrosoftWindowsServer
```

## How to run
```bash
az login
terraform init -reconfigure
terraform plan -out plan.tfplan
terraform apply plan.tfplan
```

## How to Connect
Use RDP client to connect to the VM.
In MacOS, use Mcrosoft Remote Desktop application.
