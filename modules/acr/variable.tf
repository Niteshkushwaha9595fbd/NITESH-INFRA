variable "acr" {
  description = "Map of Azure Container Registries to create"
  type = map(object({
    acr_name = string
    rg_name  = string
    location = string
  }))
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}