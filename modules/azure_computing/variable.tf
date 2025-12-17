variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    vm_name      = string
    rg_name      = string
    location     = string
    size         = string
    username     = string
    password     = string
    nic_name     = string

    os_disks = list(object({
      caching              = optional(string)
      storage_account_type = optional(string)
      disk_size_gb         = optional(number)
      name                 = optional(string)
    }))

    image_ref = list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

    tags = optional(map(string))
  }))
}
