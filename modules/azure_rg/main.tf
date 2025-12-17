resource "azurerm_resource_group" "rg" {
  for_each = var.rgs

  name     = each.value.rg_name
  location = each.value.location
  tags     = var.tags
}

output "name" {
  value = { for k, v in azurerm_resource_group.rg : k => v.name }
}

output "location" {
  value = { for k, v in azurerm_resource_group.rg : k => v.location }
}