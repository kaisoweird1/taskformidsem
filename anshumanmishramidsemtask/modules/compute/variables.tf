variable "env_name" {
  description = "The name of the environment (e.g., dev, prod)."
  type        = string
}

variable "azure_region" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the private subnet to deploy VMs into."
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group to associate with the VM NIC."
  type        = string
}

variable "instance_size" {
  description = "The size of the virtual machine (e.g., Standard_B1s)."
  type        = string
}

variable "vm_admin_password" {
  description = "The password for the admin user on the VM."
  type        = string
  sensitive   = true # Added for better security
}

variable "instance_count" {
  description = "The number of VMs to deploy."
  type        = number
}

variable "custom_data_script" {
  description = "The base64-encoded user data script."
  type        = string
}