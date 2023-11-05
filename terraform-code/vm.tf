resource "random_password" "password" {
  length           = 14
  special          = true
  override_special = "_%@"
}

resource "azurerm_resource_group" "test_rg" {
  name     = "app-test-rg"
  location = "Central India"
}

resource "azurerm_linux_virtual_machine" "test_vm" {
  name                            = "app-test-vm"
  resource_group_name             = azurerm_resource_group.test_rg.name
  location                        = azurerm_resource_group.test_rg.location
  size                            = "Standard_B2s"
  admin_username                  = "devopsuser"
  disable_password_authentication = false
  admin_password                  = random_password.password.result
  custom_data                     = base64encode(file("${path.module}/assets/script.sh"))
  network_interface_ids = [
    azurerm_network_interface.test_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}