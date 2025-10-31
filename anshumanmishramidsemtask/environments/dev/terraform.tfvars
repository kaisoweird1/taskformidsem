rg_name      = "dev-rg-web"
azure_region = "East US"

vnet_cidr_block      = ["10.0.0.0/16"]
public_subnet_cidrs  = ["10.0.1.0/24"]
private_subnet_cidrs = ["10.0.2.0/24"]

security_rules = [
  {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  },
  {
    name                       = "AllowHTTP"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
]

instance_type  = "Standard_B1s"
instance_count = 1

ip_config_name                  = "dev-internal-ip"
private_ip_allocation         = "Dynamic"
vm_image_publisher              = "Canonical"
vm_image_offer                  = "UbuntuServer"
vm_image_sku                    = "18.04-LTS"
vm_image_version                = "latest"
os_disk_name                    = "osdisk"
os_disk_caching                 = "ReadWrite"
os_disk_create_option           = "FromImage"
os_disk_type                    = "Standard_LRS"
admin_username                  = "passwordorsomethingfordevithink"
disable_password_authentication = false

public_ip_allocation_method   = "Static"
public_ip_sku                 = "Standard"
app_gateway_sku_name          = "Standard_v2"
app_gateway_sku_tier          = "Standard_v2"
app_gateway_sku_capacity      = 1
gateway_ip_config_name        = "dev-default-config"
frontend_port_name            = "dev-http-port"
frontend_port                 = 80
frontend_ip_config_name       = "dev-default-frontend-ip"
backend_pool_name             = "dev-backend-pool"
http_settings_name            = "dev-http-settings"
http_settings_cookie_affinity = "Disabled"
http_settings_port            = 80
http_settings_protocol        = "Http"
http_settings_timeout         = 60
http_settings_host_name       = "localhost"
listener_name                 = "dev-http-listener"
listener_protocol             = "Http"
routing_rule_name             = "dev-routing-rule"
routing_rule_type             = "Basic"
routing_rule_priority         = 100
probe_name                    = "dev-health-probe"
probe_protocol                = "Http"
probe_host                    = "localhost"
probe_path                    = "/"
probe_interval                = 30
probe_timeout                 = 30
probe_unhealthy_threshold     = 3