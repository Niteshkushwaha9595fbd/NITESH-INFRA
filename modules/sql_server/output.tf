output "server_ids" {
  value = {
    for k, v in azurerm_mssql_server.example : k => v.id
  }
  description = "Map of SQL Server IDs"
}