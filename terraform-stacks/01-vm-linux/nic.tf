
# NIC
resource "azurerm_network_interface" "nic01" {
  name                = "NIC01"
  location            = data.azurerm_resource_group.rg01.location
  resource_group_name = data.azurerm_resource_group.rg01.name

  ip_configuration {
    name                          = "IPConfig01"
    subnet_id                     = azurerm_subnet.snet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip01.id
  }
}

# Public IP
resource "azurerm_public_ip" "ip01" {
  name                = "PublicIP01"
  resource_group_name = data.azurerm_resource_group.rg01.name
  location            = data.azurerm_resource_group.rg01.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
