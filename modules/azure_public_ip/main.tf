# data "azurerm_resource_group" "data1" {
#     for_each = var.pip
#     name = each.value.rg_name
  
# }

resource "azurerm_public_ip" "pip" {
  for_each = var.pip

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name  # <-- implicit dependency
  location            = each.value.location  # <-- implicit dependency
  allocation_method       = lookup(each.value.optional, "allocation_method", "Dynamic")
  zones                   = lookup(each.value.optional, "zones", null)
  ddos_protection_mode    = lookup(each.value.optional, "ddos_protection_mode", null)
  ddos_protection_plan_id = lookup(each.value.optional, "ddos_protection_plan_id", null)
  domain_name_label        = lookup(each.value.optional, "domain_name_label", null)
  domain_name_label_scope  = lookup(each.value.optional, "domain_name_label_scope", null)
  edge_zone               = lookup(each.value.optional, "edge_zone", null)
  idle_timeout_in_minutes = lookup(each.value.optional, "idle_timeout_in_minutes", null)
  ip_tags                 = lookup(each.value.optional, "ip_tags", null)
  ip_version              = lookup(each.value.optional, "ip_version", null)
  public_ip_prefix_id     = lookup(each.value.optional, "public_ip_prefix_id", null)
  reverse_fqdn            = lookup(each.value.optional, "reverse_fqdn", null)
  sku                     = lookup(each.value.optional, "sku", null)
  sku_tier                = lookup(each.value.optional, "sku_tier", null)

  tags = var.tags
}
