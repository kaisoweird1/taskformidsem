variable "env_prefix" {
  description = "The prefix for the environment name "
  type        = string
}

variable "azure_location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "gateway_subnet_id" {
  description = "The ID of the public subnet for the Application Gateway."
  type        = string
}

variable "backend_vm_ips" {
  description = "A list of private IP addresses for the backend virtual machines."
  type        = list(string)

}
