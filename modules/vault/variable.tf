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
