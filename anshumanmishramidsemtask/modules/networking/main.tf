resource "azurerm_resource_group" "rg" {
  name     = var.rg_name_override
  location = var.region
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env_tag}-vnet"
  address_space       = var.vnet_cidr_block
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "public" {
  name                 = "${var.env_tag}-public-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public_subnet_cidrs
}

resource "azurerm_subnet" "private" {
  name                 = "${var.env_tag}-private-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_subnet_cidrs
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.env_tag}-nsg"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}
