data "azurerm_network_interface" "example" {
    for_each = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}



resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.vms

  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.username
  network_interface_ids = [data.azurerm_network_interface.example[each.key].id]
  admin_password      = each.value.password
   disable_password_authentication = false

  // ------------------------
  // Dynamic OS Disk Block
  // ------------------------
  dynamic "os_disk" {
    for_each = each.value.os_disks
    content {
      caching              = lookup(os_disk.value, "caching", "ReadWrite")
      storage_account_type = lookup(os_disk.value, "storage_account_type", "Standard_LRS")
      disk_size_gb         = lookup(os_disk.value, "disk_size_gb", 64)
      name                 = lookup(os_disk.value, "name", null)
    }
  }

  // ------------------------
  // Dynamic Image Reference Block
  // ------------------------
  dynamic "source_image_reference" {
    for_each = each.value.image_ref
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
     
    }
  }

  // Optional tags
  tags = merge(
    {
      "Environment" = "Dev"
    },
    lookup(each.value, "tags", {})
  )
}
