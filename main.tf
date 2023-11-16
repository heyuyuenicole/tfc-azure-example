variable "prefix" {
  type        = string
  description = "(Required) User initials for naming of resources"
}

variable "location" {
  type = string
  description = "(Optional) Azure region to use, defaults to East US."
  default = "eastus"
}

resource "azurerm_resource_group" "training" {
  name     = "azureuser${var.prefix}tfc"
  location = var.location
}

resource "azurerm_virtual_network" "training" {
  name                = "azureuser${var.prefix}tfc"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.training.location
  resource_group_name = azurerm_resource_group.training.name
}

resource "azurerm_subnet" "training" {
  name                 = "azureuser${var.prefix}sub"
  resource_group_name  = azurerm_resource_group.training.name
  virtual_network_name = azurerm_virtual_network.training.name
  address_prefixes     = ["10.0.2.0/24"]
}
