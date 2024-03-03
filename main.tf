
resource "azurerm_resource_group" "rg1" {
  name     = "sales-team"
  location = "australiaeast"
}

resource "azurerm_virtual_network" "vn1" {
  name                = "salesteam-vn1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "salesteam-subnet"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vn1.name
  address_prefixes     = ["10.0.2.0/25"]
}

resource "azurerm_network_interface" "nic1" {
  name                = "salesteam-nic"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"

  }
}
resource "azurerm_linux_virtual_machine" "linux1" {
  admin_username                  = "swetha-linux"
  admin_password                  = "Cloud@123"
  disable_password_authentication = false
  location                        = azurerm_resource_group.rg1.location
  name                            = "sales-linux-vm"
  network_interface_ids = [
    azurerm_network_interface.nic1.id
  ]
  resource_group_name = azurerm_resource_group.rg1.name
  size                = "Standard_B1s"
  computer_name       = "oms"
  tags = {
    environment = "purchase-dept"
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = 100
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  zone = "1"
}