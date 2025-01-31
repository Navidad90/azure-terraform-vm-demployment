# Azure Virtual Network Deployment using Terraform

## Overview
This Terraform configuration deploys an **Azure Virtual Network (VNet)** and **Subnet** in the `germanywestcentral` region.

## Resources Created
- **Virtual Network (`azurerm_virtual_network`)**: Creates a VNet with a specified address space.
- **Subnet (`azurerm_subnet`)**: Creates a subnet within the VNet.

## Deployment Steps
### Step 1: Initialize Terraform
```sh
terraform init
