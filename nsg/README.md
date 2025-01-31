# Azure Network Security Group (NSG) Deployment using Terraform

## Overview
This Terraform configuration deploys a **Network Security Group (NSG)** on **Azure**.  
The NSG applies firewall rules to secure virtual machines and networking resources.

## **Features**
- **Inbound & Outbound Security Rules**
- **Allows Remote Desktop Protocol (RDP)**
- **Protects Azure VMs and Subnets**

---

## **Prerequisites**
Ensure you have:
- An **Azure subscription**.
- **Terraform installed** (`>=1.9.8`).
- **Azure CLI installed** and logged in:  
  ```sh
  az login
