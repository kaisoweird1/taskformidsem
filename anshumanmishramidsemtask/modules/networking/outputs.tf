variable "env_tag" {
  description = "The tag for the environment (e.g., dev, staging, prod)."
  type        = string
}

variable "region" {
  description = "The Azure region to create resources in."
  type        = string
}

variable "rg_name_override" {
  description = "The specific name for the resource group."
  type        = string
}

variable "vnet_cidr_block" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "The address prefix for the public subnet."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "The address prefix for the private subnet."
  type        = list(string)
}

variable "security_rules" {
  description = "A list of security rules to apply to the NSG."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
