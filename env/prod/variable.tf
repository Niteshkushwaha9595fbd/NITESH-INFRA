

variable "rgs" {
  description = "Map of resource groups with their names and locations"
  type = map(object({
    rg_name  = string
    location = string
  }))
}
variable "pip" {
  description = "Map of Public IP configurations"
  type = map(object({
    rg_name  = string
    location = string
    pip_name = string
    optional = optional(object({
      allocation_method       = optional(string)
      zones                   = optional(list(string))
      ddos_protection_mode    = optional(string)
      ddos_protection_plan_id = optional(string)
      domain_name_label        = optional(string)
      domain_name_label_scope  = optional(string)
      edge_zone               = optional(string)
      idle_timeout_in_minutes = optional(number)
      ip_tags                 = optional(map(string))
      ip_version              = optional(string)
      public_ip_prefix_id     = optional(string)
      reverse_fqdn            = optional(string)
      sku                     = optional(string)
      sku_tier                = optional(string)
    }))
  }))
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}
variable "vnet" {
  description = "Map of Virtual Network configurations"
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
    dns_servers   = optional(list(string), []) # optional, default empty list
  }))
}
variable "subnet" {
  description = "Map of Subnet configurations"
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
  }))
}

variable "nic" {
  description = "Map of Network Interface configurations"
  type = map(object({
    nic_name              = string
    location              = string
    rg_name               = string
    vnet_name             = string
    subnet_name           = string
    private_ip_allocation = optional(string, "Dynamic") # Dynamic or Static
    public_ip_name = optional(string, "Dynamic")
    
  }))
}

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

variable "acr" {
  description = "Map of Azure Container Registries to create"
  type = map(object({
    acr_name = string
    rg_name  = string
    location = string
  }))
}

variable "vault" {
  description = "Map of Key Vault configurations"
  type = map(object({
    vault_name                 = string
    rg_name                    = string
    location                   = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
  }))
}
variable "stg" {
  description = "Storage account configuration details"
  type = map(object({
    stg_name    = string
    rg_name     = string
    location    = string
    vnet_name   = string
    subnet_name = string
  }))
}

# Variable for AKS clusters
variable "aks" {
  description = "Map of AKS clusters to create"
  type = map(object({
    aks_name  = string
    location  = string
    rg_name   = string
    dns_prefix = optional(string, "exampleaks1")
    kubernetes_version  = optional(string)
  }))
}

# Variable for default node pools
variable "default_node_pool" {
  description = "Map of default node pool settings for each cluster"
  type = map(object({
    name       = string
    node_count = number
    vm_size    = string
  }))
}

# variable "db" {
#   description = "List of DB objects for creating multiple SQL databases"
#   type = map(object({
#     db_name = string
#   }))
# }
variable "sql_server" {
  description = "SQL Server details for creating multiple SQL Servers"
  type = map(object({
    sql_server_name = string
    rg_name         = string
    location        = string
  }))
}

variable "db" {
  description = "Map of DBs to create"
  type = map(object({
    db_name    = string
    server_key = string
  }))
}