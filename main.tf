provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "Contoso-resourcegroup-europe"
  location = "germanywestcentral"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "ContosoVirtualNetwork"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "ContosoSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
