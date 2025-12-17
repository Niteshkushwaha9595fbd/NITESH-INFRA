variable "stg" {
  description = "Storage account configuration details"
  type = map(object({
    stg_name    = string
    rg_name     = string
    location    = string
    vnet_name   = string
    subnet_name = string
  }))
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}