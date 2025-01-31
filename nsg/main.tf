provider "azurerm" {
  features {}
  subscription_id = "w2e3r4t5-t556-u7i8-8953-u7i8o9p0r4t5"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "ContosoNSG"
  location            = "Germany West Central"
  resource_group_name = "Contoso-resourcegroup-europe"
}

resource "azurerm_network_security_rule" "allow_rdp" {
  name                        = "AllowRDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "Contoso-resourcegroup-europe"
  network_security_group_name = "ContosoNSG"
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = "/subscriptions/w2e3r4t5-t556-u7i8-8953-u7i8o9p0r4t5/resourceGroups/Contoso-resourcegroup-europe/providers/Microsoft.Network/virtualNetworks/ContosoVirtualNetwork/subnets/ContosoSubnet"
  network_security_group_id = azurerm_network_security_group.nsg.id
}
