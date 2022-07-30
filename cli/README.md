# Azure CLI
## 01 Installing the Azure CLI
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

az group list

# Create a virtual machine
az vm create --resource-group TutorialResources \
  --name TutorialVM1 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose

az vm list

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

### Using PowerShell
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-powershell
https://docs.microsoft.com/en-us/powershell/module/az.compute/new-azvm?view=azps-7.5.0

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