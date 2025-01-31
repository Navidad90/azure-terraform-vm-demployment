provider "azurerm" {
  features {}
  subscription_id = "w2e3r4t5-t556-u7i8-8953-u7i8o9p0r4t5"
}

resource "azurerm_resource_group" "rg" {
  name     = "Contoso-resourcegroup-europe"
  location = "Germany West Central"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "ContosoVirtualNetwork"
  location            = "Germany West Central"
  resource_group_name = "Contoso-resourcegroup-europe"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "ContosoSubnet"
  resource_group_name  = "Contoso-resourcegroup-europe"
  virtual_network_name = "ContosoVirtualNetwork"
  address_prefixes     = ["10.0.1.0/24"]
}
