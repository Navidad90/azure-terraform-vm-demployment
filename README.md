Azure Terraform VM Deployment

Step 1: Prerequisites

Before you start, ensure you have the following installed:

✅ Terraform CLI
✅ Azure CLI
✅ Git (to clone the repository)

Step 2: Clone the Repository

Open Command Prompt, Terminal, or PowerShell.

Clone the repository from GitHub:
git clone https://github.com/Navidad90/azure-terraform-vm-deployment.git
Navigate into the directory:
cd azure-terraform-vm-deployment

Step 3: Authenticate with Azure

Login to Azure:
az login
az account set --subscription "<your-subscription-id>"

Step 4: Deploy Infrastructure

Now, apply the Terraform code folder by folder.
1️⃣ Deploy Virtual Network (VNet)
cd vnet
terraform init
terraform apply -auto-approve
cd ..

2️⃣ Deploy Network Security Group (NSG)
cd nsg
terraform init
terraform apply -auto-approve
cd ..

3️⃣ Deploy Virtual Machines (VMs)
cd vm
terraform init
terraform apply -auto-approve
