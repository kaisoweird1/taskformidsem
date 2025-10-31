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
  sensitive   = true
}

variable "instance_count" {
  description = "The number of VMs to deploy."
  type        = number
}

variable "custom_data_script" {
  description = "The base64-encoded user data script."
  type        = string
}

variable "ip_config_name" {
  description = "Name for the VM's IP configuration."
  type        = string
}

variable "private_ip_allocation" {
  description = "The private IP allocation method (e.g., Dynamic, Static)."
  type        = string
}

variable "vm_image_publisher" {
  description = "The publisher of the VM image."
  type        = string
}

variable "vm_image_offer" {
  description = "The offer of the VM image."
  type        = string
}

variable "vm_image_sku" {
  description = "The SKU of the VM image."
  type        = string
}

variable "vm_image_version" {
  description = "The version of the VM image."
  type        = string
}

variable "os_disk_name" {
  description = "Prefix for the OS disk name."
  type        = string
}

variable "os_disk_caching" {
  description = "The caching mode for the OS disk (e.g., ReadWrite, ReadOnly)."
  type        = string
}

variable "os_disk_create_option" {
  description = "The create option for the OS disk (e.g., FromImage)."
  type        = string
}

variable "os_disk_type" {
  description = "The type of managed disk to create (e.G., Standard_LRS, Premium_LRS)."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the VM."
  type        = string
}

variable "disable_password_authentication" {
  description = "Set to true to disable password authentication."
  type        = bool
}
