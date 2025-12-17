resource "azurerm_mssql_database" "example" {

for_each = var.db

  name         = each.value.db_name
  server_id    = var.server_ids[each.value.server_key] 
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  tags = var.tags
}
