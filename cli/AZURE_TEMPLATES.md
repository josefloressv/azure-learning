# Azure Templates

https://github.com/Azure/azure-quickstart-templates

## Depployment a simple VM
https://azure.microsoft.com/en-us/resources/templates/vm-simple-windows/

This template allows you to deploy a simple Windows VM using a few different options for the Windows version, using the latest patched version. This will deploy an A2 size VM in the resource group location and return the FQDN of the VM.

Azure PowerShell
```powershell
New-AzResourceGroup -Name AZRGPWS -Location 'Central US' #use this command when you need to create a new resource group for your deployment
New-AzResourceGroupDeployment -ResourceGroupName AZRGPWS -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.compute/vm-simple-windows/azuredeploy.json
```

Azure CLI
```bash
az group create --name AZRGCLI --location 'Central US' #use this command when you need to create a new resource group for your deployment
az group deployment create --resource-group AZRGCLI --template-uri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.compute/vm-simple-windows/azuredeploy.json
```

CustomizedTemplate
```json
{
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "location": {
            "type": "string"
        },
        "networkInterfaceName1": {
            "type": "string"
        },
        "enableAcceleratedNetworking": {
            "type": "bool"
        },
        "networkSecurityGroupName": {
            "type": "string"
        },
        "networkSecurityGroupRules": {
            "type": "array"
        },
        "subnetName": {
            "type": "string"
        },
        "virtualNetworkName": {
            "type": "string"
        },
        "addressPrefixes": {
            "type": "array"
        },
        "subnets": {
            "type": "array"
        },
        "publicIpAddressName1": {
            "type": "string"
        },
        "publicIpAddressType": {
            "type": "string"
        },
        "publicIpAddressSku": {
            "type": "string"
        },
        "pipDeleteOption": {
            "type": "string"
        },
        "virtualMachineName": {
            "type": "string"
        },
        "virtualMachineName1": {
            "type": "string"
        },
        "virtualMachineComputerName1": {
            "type": "string"
        },
        "virtualMachineRG": {
            "type": "string"
        },
        "osDiskType": {
            "type": "string"
        },
        "osDiskDeleteOption": {
            "type": "string"
        },
        "virtualMachineSize": {
            "type": "string"
        },
        "nicDeleteOption": {
            "type": "string"
        },
        "adminUsername": {
            "type": "string"
        },
        "zone": {
            "type": "string"
        }
    },
    "variables": {
        "nsgId": "[resourceId(resourceGroup().name, 'Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupName'))]",
        "vnetName": "[parameters('virtualNetworkName')]",
        "vnetId": "[resourceId(resourceGroup().name,'Microsoft.Network/virtualNetworks', parameters('virtualNetworkName'))]",
        "subnetRef": "[concat(variables('vnetId'), '/subnets/', parameters('subnetName'))]"
    },
    "resources": [
        {
            "name": "[parameters('networkInterfaceName1')]",
            "type": "Microsoft.Network/networkInterfaces",
            "apiVersion": "2021-03-01",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[concat('Microsoft.Network/networkSecurityGroups/', parameters('networkSecurityGroupName'))]",
                "[concat('Microsoft.Network/virtualNetworks/', parameters('virtualNetworkName'))]",
                "[concat('Microsoft.Network/publicIpAddresses/', parameters('publicIpAddressName1'))]"
            ],
            "properties": {
                "ipConfigurations": [
                    {
                        "name": "ipconfig1",
                        "properties": {
                            "subnet": {
                                "id": "[variables('subnetRef')]"
                            },
                            "privateIPAllocationMethod": "Dynamic",
                            "publicIpAddress": {
                                "id": "[resourceId(resourceGroup().name, 'Microsoft.Network/publicIpAddresses', parameters('publicIpAddressName1'))]",
                                "properties": {
                                    "deleteOption": "[parameters('pipDeleteOption')]"
                                }
                            }
                        }
                    }
                ],
                "enableAcceleratedNetworking": "[parameters('enableAcceleratedNetworking')]",
                "networkSecurityGroup": {
                    "id": "[variables('nsgId')]"
                }
            }
        },
        {
            "name": "[parameters('networkSecurityGroupName')]",
            "type": "Microsoft.Network/networkSecurityGroups",
            "apiVersion": "2019-02-01",
            "location": "[parameters('location')]",
            "properties": {
                "securityRules": "[parameters('networkSecurityGroupRules')]"
            }
        },
        {
            "name": "[parameters('virtualNetworkName')]",
            "type": "Microsoft.Network/virtualNetworks",
            "apiVersion": "2020-11-01",
            "location": "[parameters('location')]",
            "properties": {
                "addressSpace": {
                    "addressPrefixes": "[parameters('addressPrefixes')]"
                },
                "subnets": "[parameters('subnets')]"
            }
        },
        {
            "name": "[parameters('publicIpAddressName1')]",
            "type": "Microsoft.Network/publicIpAddresses",
            "apiVersion": "2020-08-01",
            "location": "[parameters('location')]",
            "properties": {
                "publicIpAllocationMethod": "[parameters('publicIpAddressType')]"
            },
            "sku": {
                "name": "[parameters('publicIpAddressSku')]"
            },
            "zones": [
                "1"
            ]
        },
        {
            "name": "[parameters('virtualMachineName1')]",
            "type": "Microsoft.Compute/virtualMachines",
            "apiVersion": "2021-07-01",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[concat('Microsoft.Network/networkInterfaces/', parameters('networkInterfaceName1'))]"
            ],
            "properties": {
                "hardwareProfile": {
                    "vmSize": "[parameters('virtualMachineSize')]"
                },
                "storageProfile": {
                    "osDisk": {
                        "createOption": "fromImage",
                        "managedDisk": {
                            "storageAccountType": "[parameters('osDiskType')]"
                        },
                        "deleteOption": "[parameters('osDiskDeleteOption')]"
                    },
                    "imageReference": {
                        "publisher": "canonical",
                        "offer": "0001-com-ubuntu-server-focal",
                        "sku": "20_04-lts-gen2",
                        "version": "latest"
                    }
                },
                "networkProfile": {
                    "networkInterfaces": [
                        {
                            "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceName1'))]",
                            "properties": {
                                "deleteOption": "[parameters('nicDeleteOption')]"
                            }
                        }
                    ]
                },
                "osProfile": {
                    "computerName": "[parameters('virtualMachineComputerName1')]",
                    "adminUsername": "[parameters('adminUsername')]",
                    "linuxConfiguration": {
                        "disablePasswordAuthentication": true
                    }
                },
                "diagnosticsProfile": {
                    "bootDiagnostics": {
                        "enabled": true
                    }
                }
            },
            "zones": [
                "1"
            ]
        }
    ],
    "outputs": {
        "adminUsername": {
            "type": "string",
            "value": "[parameters('adminUsername')]"
        }
    }
}
```

Deployment from template
```bash
az group create --name AZRGCLICO --location 'Central India'
az deployment group create --resource-group AZRGCLICO --template-file azure-ubuntu-deploy.json
# multipe errores and need to fill manually the paramenters
```