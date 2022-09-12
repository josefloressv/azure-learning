# resource "azurerm_resource_group" "rg01" {
#   name     = "02-vm-windows-server"
#   location = "West Europe"
# }

# using RG from ACG Azure Playground 
data "azurerm_resource_group" "rg01" {
  name = "1-f3d8287b-playground-sandbox"
}