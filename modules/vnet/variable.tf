variable "vnet" {
  description = "Map of Virtual Network configurations"
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
    dns_servers   = optional(list(string), []) # optional, default empty list
  }))
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}