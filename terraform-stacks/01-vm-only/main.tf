resource "azurerm_linux_virtual_machine" "vm01" {
  name                = "TutorialVM1"
  resource_group_name = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic01.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # az vm image list --publisher Canonical
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku = "18.04-LTS"
    version   = "latest"
  }
}