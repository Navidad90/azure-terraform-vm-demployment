provider "azurerm" {
  features {}
  subscription_id = "w2e3r4t5-t556-u7i8-8953-u7i8o9p0r4t5"
}

resource "azurerm_public_ip" "pip1" {
  name                = "ContosoVM1-PublicIP"
  location            = "Germany West Central"
  resource_group_name = "Contoso-resourcegroup-europe"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip" "pip2" {
  name                = "ContosoVM2-PublicIP"
  location            = "Germany West Central"
  resource_group_name = "Contoso-resourcegroup-europe"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic1" {
  name                = "ContosoVM1-NIC"
  location            = "Germany West Central"
  resource_group_name = "Contoso-resourcegroup-europe"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/w2e3r4t5-t556-u7i8-8953-u7i8o9p0r4t5/resourceGroups/Contoso-resourcegroup-europe/providers/Microsoft.Network/virtualNetworks/ContosoVirtualNetwork/subnets/ContosoSubnet"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip1.id
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "ContosoVM2-NIC"
  location            = "Germany West Central"
  resource_group_name = "Contoso-resourcegroup-europe"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/w2e3r4t5-t556-u7i8-8953-u7i8o9p0r4t5/resourceGroups/Contoso-resourcegroup-europe/providers/Microsoft.Network/virtualNetworks/ContosoVirtualNetwork/subnets/ContosoSubnet"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip2.id
  }
}

resource "random_password" "password" {
  length  = 16
  special = true
}

resource "azurerm_windows_virtual_machine" "vm1" {
  name                  = "ContosoVM1"
  resource_group_name   = "Contoso-resourcegroup-europe"
  location              = "Germany West Central"
  size                  = "Standard_D2s_v3"
  admin_username        = "adminuser"
  admin_password        = random_password.password.result
  network_interface_ids = [azurerm_network_interface.nic1.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku
