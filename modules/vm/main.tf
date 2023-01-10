resource "azurerm_network_interface" "net-interface" {
    name = var.network
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = var.ipconfig
        subnet_id = var.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "vm" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.net-interface.id ]
  vm_size = "Standard_D2s_v3"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.host_name
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
