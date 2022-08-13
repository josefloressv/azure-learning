# Azure Windows Virtual Machine
Resources
* [azurerm_windows_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine)
* [network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)
* [subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)
* [public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)

Information on available virtual machine images.
https://docs.microsoft.com/en-us/cli/azure/vm/image?view=azure-cli-latest

```bash
az vm image list --all --publisher MicrosoftWindowsDesktop --offer windows-11 --architecture x64
#example output
  {
    "architecture": "x64",
    "offer": "windows-11",
    "publisher": "MicrosoftWindowsDesktop",
    "sku": "win11-21h2-pron",
    "urn": "MicrosoftWindowsDesktop:windows-11:win11-21h2-pron:22000.856.220805",
    "version": "22000.856.220805"
  }
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
