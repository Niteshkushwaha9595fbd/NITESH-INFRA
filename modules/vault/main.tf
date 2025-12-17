data "azurerm_client_config" "current" {}





resource "azurerm_key_vault" "example" {
    for_each = var.vault
  name                       = each.value.vault_name
  location                   = each.value.location
  resource_group_name        = each.value.rg_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Delete",
      "Get",
      "Purge",
      "Recover",
      "Update",
      "GetRotationPolicy",
      "SetRotationPolicy"
    ]

    secret_permissions = [
      "Set",
    ]
  }
}