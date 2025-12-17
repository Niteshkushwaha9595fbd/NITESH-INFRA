variable "pip" {
  description = "Map of Public IP configurations"
  type = map(object({
    rg_name  = string
    location = string
    pip_name = string
    optional = optional(object({
      allocation_method       = optional(string)
      zones                   = optional(list(string))
      ddos_protection_mode    = optional(string)
      ddos_protection_plan_id = optional(string)
      domain_name_label        = optional(string)
      domain_name_label_scope  = optional(string)
      edge_zone               = optional(string)
      idle_timeout_in_minutes = optional(number)
      ip_tags                 = optional(map(string))
      ip_version              = optional(string)
      public_ip_prefix_id     = optional(string)
      reverse_fqdn            = optional(string)
      sku                     = optional(string)
      sku_tier                = optional(string)
    }))
  }))
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}
