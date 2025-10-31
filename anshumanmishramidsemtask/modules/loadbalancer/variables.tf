
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
