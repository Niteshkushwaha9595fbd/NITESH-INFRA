variable "rgs" {
  description = "Map of resource groups with their names and locations"
  type = map(object({
    rg_name  = string
    location = string
  }))
}

variable "tags" {
  description = "Common tags to apply to all resource groups"
  type        = map(string)
  default     = {}
}
