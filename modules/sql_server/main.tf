resource "azurerm_mssql_server" "example" {

    for_each = var.sql_server
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "Ashu@#991926"
}