# data "azurerm_subnet" "example" {
#     for_each = var.stg
#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.vnet_name
#   resource_group_name  = each.value.rg_name
# }




resource "azurerm_storage_account" "example" {
    for_each = var.stg
  name                = each.value.stg_name
  resource_group_name = each.value.rg_name

  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

#   network_rules {
#     default_action             = "Deny"
#     ip_rules                   = ["100.0.0.1"]
#     virtual_network_subnet_ids = [data.azurerm_subnet.example[each.key].id]
#   }

  tags = var.tags
}