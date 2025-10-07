resource "azurerm_network_interface" "nic" {
  count               = var.instance_count
  name                = "${var.env_name}-vm-nic-${count.index}"
  location            = var.azure_region
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
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
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.env_name}-vm-${count.index}"
    admin_username = "adminuser"
    admin_password = var.vm_admin_password
    custom_data    = var.custom_data_script
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}