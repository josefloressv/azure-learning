# Azure CLI

## 01 Installing the Azure CLI in MacOS
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macos

```bash
brew update && brew install azure-cli
az --version
```

## 02 Login
https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli#how-to-sign-into-the-azure-cli
```bash
az login
```

Note: With ACG in incognito windows there is another way to login

first
```bash
az login --use-device-code
```
then, go to https://microsoft.com/devicelogin and enter the code generated above

and you will see in the console:
```json
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "********-4b61-4c3b-942c-********",
    "id": "c791bc0b-*****-4b6d-a684-******",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Azure subscription 1",
    "state": "Enabled",
    "tenantId": "********-4b61-4c3b-942c-********",
    "user": {
      "name": "jose@example.com",
      "type": "user"
    }
  }
]
```
## 03 Install Visual Studio Code plugin for Azure CLI
https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli

## Create virtual machines (VM)
### using CLI
```bash
# Create a resource group
az group create --name TutorialResources --location eastus

az group list -o table

# Create a virtual machine
az vm create --resource-group TutorialResources \
  --name TutorialVM1 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose

az vm list -o table

# Connect through SSH, uses the SSH key generated earlier
ssh <PUBLIC_IP_ADDRESS>

# Get VM information with queries
az vm show --name TutorialVM1 --resource-group TutorialResources

## get the NIC object ID of the VM
az vm show --name TutorialVM1 \
  --resource-group TutorialResources \
  --query 'networkProfile.networkInterfaces[].id' \
  --output tsv

### save the NIC object ID to a variable
NIC_ID=$(az vm show -n TutorialVM1 -g TutorialResources \
  --query 'networkProfile.networkInterfaces[].id' \
  -o tsv)

## get information about the NIC
az network nic show --ids $NIC_ID

### get only the IP and Subnet ID of the NIC
az network nic show --ids $NIC_ID \
  --query '{IP:ipConfigurations[].publicIpAddress.id, Subnet:ipConfigurations[].subnet.id}' \
  -o json
```

## Clean up
```bash
az group delete --name TutorialResources --no-wait
```
## Usefull commands
```bash
# List available locations
az account list-locations -o table

```

# PowerShell

- First, [Update PowerShell to the latest version](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2#msi)
- Next, [Install the Az PowerShell module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-8.2.0)
- Finally, Sign in to Azure
```powershell
Connect-AzAccount
#Account                               SubscriptionName TenantId                             Environment
#-------                               ---------------- --------                             -----------
#user@mail.edu.sv AZ200KFREE           cc0dbb84-4b61-4c3b-942c-fdsafdasafsdf                 AzureCloud
```

...And create a [Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-powershell), [Syntax](https://docs.microsoft.com/en-us/powershell/module/az.compute/new-azvm?view=azps-7.5.0)

```powershell
# show PowerShell version
$PSVersionTable.PSVersion 

# Create a resource group
New-AzResourceGroup -Name TutorialResources -Location "eastus"

Get-AzResourceGroup | Format-Table

# Create a virtual machine
New-AzVm `
 -ResourceGroupName "TutorialResources" `
 -Name "TutorialVM1" `
 -Image "UbuntuLTS" `
 -GenerateSSHKey `
 -SshKeyName mySSHKey
 -Verbose

# Get VM information with queries
Get-AzVm | Format-Table

Get-AzVM -name TutorialVM1 -status | Format-Table -autosize

# Stop the VM
Stop-AzVM -ResourceGroupName TutorialResources -Name TutorialVM1
```

## Clean up
```powershell
Remove-AzResourceGroup -Name TutorialResources -Force
```

## Usefull commands
```powershell
# List available locations
Get-AzLocation | Format-Table

# Get the available VM sizes for an Azure region
Get-AzVMSize -Location "eastus" | Format-Table -autosize
```