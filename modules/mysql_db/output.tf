# output "id" {
#   value = azurerm_mssql_server.example.id
# }
# output "server_ids" {
#   description = "Map of SQL Server IDs keyed by each server's map key"
#   value = {
#     for k, v in azurerm_mssql_server.example :
#     k => v.id
#   }
# }