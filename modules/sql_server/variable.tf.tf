variable "sql_server" {
  description = "Map of SQL Servers to create"
  type = map(object({
    sql_server_name = string
    rg_name         = string
    location        = string
  }))
}