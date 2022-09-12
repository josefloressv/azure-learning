resource "azurerm_windows_virtual_machine" "vm01" {
  name                = "TutorialVM2"
  resource_group_name = data.azurerm_resource_group.rg01.name
  location            = data.azurerm_resource_group.rg01.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # az vm image list --publisher MicrosoftWindowsServer
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}