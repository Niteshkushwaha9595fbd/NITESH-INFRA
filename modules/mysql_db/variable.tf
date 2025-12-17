variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}

# variable "db" {
#   description = "List of DB objects for creating multiple SQL databases"
#   type = map(object({
#     db_name = string
#   }))
# }

variable "server_ids" {
  description = "Map of server IDs from SQL server module"
  type        = map(string)
}

variable "db" {
  description = "Map of DBs to create"
  type = map(object({
    db_name    = string
    server_key = string
  }))
}