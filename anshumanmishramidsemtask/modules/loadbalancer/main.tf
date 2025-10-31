resource "azurerm_public_ip" "app_gateway_ip" {
  name                = "${var.env_prefix}-app-gateway-public-ip"
  location            = var.azure_location
  resource_group_name = var.rg_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = "${var.env_prefix}-app-gateway"
  location            = var.azure_location
  resource_group_name = var.rg_name

  sku {
    name     = var.app_gateway_sku_name
    tier     = var.app_gateway_sku_tier
    capacity = var.app_gateway_sku_capacity
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_config_name
    subnet_id = var.gateway_subnet_id
  }

  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_config_name
    public_ip_address_id = azurerm_public_ip.app_gateway_ip.id
  }

  backend_address_pool {
    name         = var.backend_pool_name
    ip_addresses = var.backend_vm_ips
  }

  backend_http_settings {
    name                  = var.http_settings_name
    cookie_based_affinity = var.http_settings_cookie_affinity
    port                  = var.http_settings_port
    protocol              = var.http_settings_protocol
    request_timeout       = var.http_settings_timeout
    probe_name            = var.probe_name
    host_name             = var.http_settings_host_name
  }

  http_listener {
    name                           = var.listener_name
    frontend_ip_configuration_name = var.frontend_ip_config_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.listener_protocol
  }

  request_routing_rule {
    name                       = var.routing_rule_name
    rule_type                  = var.routing_rule_type
    http_listener_name         = var.listener_name
    backend_address_pool_name  = var.backend_pool_name
    backend_http_settings_name = var.http_settings_name
    priority                   = var.routing_rule_priority
  }

  probe {
    name                = var.probe_name
    protocol            = var.probe_protocol
    host                = var.probe_host
    path                = var.probe_path
    interval            = var.probe_interval
    timeout             = var.probe_timeout
    unhealthy_threshold = var.probe_unhealthy_threshold
  }
}
