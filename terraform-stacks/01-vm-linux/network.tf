resource "azurerm_virtual_network" "vn01" {
  name                = "Network01"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.rg01.location
  resource_group_name = data.azurerm_resource_group.rg01.name
}

resource "azurerm_subnet" "snet01" {
  name                 = "SubNet01"
  resource_group_name  = data.azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vn01.name
  address_prefixes     = ["10.0.2.0/24"]
}
