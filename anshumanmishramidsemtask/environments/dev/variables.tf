variable "rg_name" {
  description = "Name of the Azure resource group for the dev environment."
  type        = string
}

variable "azure_region" {
  description = "Azure region for the dev environment."
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

variable "instance_type" {
  description = "The VM size to use for dev (e.g., Standard_B1s)."
  type        = string
}

variable "instance_count" {
  description = "Number of VMs to deploy in the dev environment."
  type        = number
}

variable "vm_admin_password" {
  description = "Admin password for the dev VMs. Injected by CI/CD."
  type        = string
  sensitive   = true
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

variable "public_ip_allocation_method" {
  description = "Allocation method for the Public IP."
  type        = string
}

variable "public_ip_sku" {
  description = "SKU for the Public IP."
  type        = string
}

variable "app_gateway_sku_name" {
  description = "The name of the App Gateway SKU."
  type        = string
}

variable "app_gateway_sku_tier" {
  description = "The tier of the App Gateway SKU."
  type        = string
}

variable "app_gateway_sku_capacity" {
  description = "The capacity of the App Gateway SKU."
  type        = number
}

variable "gateway_ip_config_name" {
  description = "Name for the gateway IP configuration."
  type        = string
}

variable "frontend_port_name" {
  description = "Name for the frontend port."
  type        = string
}

variable "frontend_ip_config_name" {
  description = "Name for the frontend IP configuration."
  type        = string
}

variable "backend_pool_name" {
  description = "Name for the backend address pool."
  type        = string
}

variable "http_settings_name" {
  description = "Name for the backend HTTP settings."
  type        = string
}

variable "listener_name" {
  description = "Name for the HTTP listener."
  type        = string
}

variable "routing_rule_name" {
  description = "Name for the request routing rule."
  type        = string
}

variable "probe_name" {
  description = "Name for the health probe."
  type        = string
}

variable "frontend_port" {
  description = "The port for the frontend."
  type        = number
}

variable "http_settings_cookie_affinity" {
  description = "Cookie-based affinity."
  type        = string
}

variable "http_settings_port" {
  description = "The port for the backend HTTP settings."
  type        = number
}

variable "http_settings_protocol" {
  description = "The protocol for the backend HTTP settings."
  type        = string
}

variable "http_settings_timeout" {
  description = "Request timeout in seconds."
  type        = number
}

variable "http_settings_host_name" {
  description = "Host name to send in the probe."
  type        = string
}

variable "listener_protocol" {
  description = "Protocol for the listener."
  type        = string
}

variable "routing_rule_type" {
  description = "The type of routing rule."
  type        = string
}

variable "routing_rule_priority" {
  description = "Priority of the routing rule."
  type        = number
}

variable "probe_protocol" {
  description = "Protocol for the probe."
  type        = string
}

variable "probe_host" {
  description = "Host to probe."
  type        = string
}

variable "probe_path" {
  description = "Path to probe."
  type        = string
}

variable "probe_interval" {
  description = "Probe interval in seconds."
  type        = number
}

variable "probe_timeout" {
  description = "Probe timeout in seconds."
  type        = number
}

variable "probe_unhealthy_threshold" {
  description = "Number of failed probes to mark as unhealthy."
  type        = number
}
