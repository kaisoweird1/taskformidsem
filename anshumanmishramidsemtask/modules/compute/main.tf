resource "azurerm_network_interface" "nic" {
  count               = var.instance_count
  name                = "${var.env_name}-vm-nic-${count.index}"
  location            = var.azure_region
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  count                     = var.instance_count
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_virtual_machine" "vm" {
  count                 = var.instance_count
  name                  = "${var.env_name}-vm-${count.index}"
  location              = var.azure_region
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  vm_size               = var.instance_size

  storage_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  storage_os_disk {
    name              = "${var.os_disk_name}-${count.index}"
    caching           = var.os_disk_caching
    create_option     = var.os_disk_create_option
    managed_disk_type = var.os_disk_type
  }

  os_profile {
    computer_name  = "${var.env_name}-vm-${count.index}"
    admin_username = var.admin_username
    admin_password = var.vm_admin_password
    custom_data    = var.custom_data_script
  }

  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
  }
}
