variable "location" {
  default = "germanywestcentral"
}

variable "resource_group_name" {
  default = "Contoso-resourcegroup-europe"
}

variable "vm_name" {
  default = "ContosoVM1"
}

variable "admin_password" {
  sensitive = true
  default   = "SuperSecurePassword123!"
}

variable "nic_id" {
  default = "/subscriptions/xxxx/resourceGroups/Contoso-resourcegroup-europe/providers/Microsoft.Network/networkInterfaces/ContosoVM1-NIC"
}
