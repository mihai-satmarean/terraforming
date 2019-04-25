
# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = "westeurope"
    resource_group_name   = "${azurerm_resource_group.test.name}"
    network_interface_ids = ["${azurerm_network_interface.myterraformnic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdPu7D7x5+Mz2W9YZ5otzdGLKdC8cVFipRHrJuefZmz2OP/TaznFYJkwsZMaI1nrQu2kljBxi7EcRiWJK7mbyS/R1ZM+tviZ/TuuzdS/W9CZWWA4Zm7uAjJ6apeotmCvrv5vNcIikwRJvvFpq/8d6nA72Or3rvzSe3i9D2qq+ZLSAjjQXh72ijAuC/vx8iejrIwjnBlusiLoz9QV8yd46vKK7DI5a+olLuApJSg39p5AIi9KH0mhuFba2dPdlbkdavDDY5WDjRPxM4hoXBAuBkR9tCvyAK40IR8kqVeDsBiILovgQWYPYM2WtEkUGeRr+O1qZ1yFdu1yU94K+FV9lH"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags {
        environment = "run whatever you want"
    }
}
