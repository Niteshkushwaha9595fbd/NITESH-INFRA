variable "nic" {
  description = "Map of Network Interface configurations"
  type = map(object({
    nic_name              = string
    location              = string
    rg_name               = string
    vnet_name             = string
    subnet_name           = string
    private_ip_allocation = optional(string, "Dynamic") # Dynamic or Static
    public_ip_name = optional(string, "Dynamic")
    
  }))
}

variable "tags" {
  description = "Tags to apply to all NICs"
  type        = map(string)
  default     = {}
}