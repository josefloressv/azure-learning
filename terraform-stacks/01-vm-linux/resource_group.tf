# resource "azurerm_resource_group" "rg01" {
#   name     = "01-vm-linux"
#   location = "West Europe"
# }

# using RG from ACG Azure Playground 
data "azurerm_resource_group" "rg01" {
  name = "1-f3d8287b-playground-sandbox"
}