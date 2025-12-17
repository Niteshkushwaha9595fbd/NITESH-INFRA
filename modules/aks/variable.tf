# Variable for AKS clusters
variable "aks" {
  description = "Map of AKS clusters to create"
  type = map(object({
    aks_name  = string
    location  = string
    rg_name   = string
    dns_prefix = optional(string, "exampleaks1")
    kubernetes_version  = optional(string)
  }))
}

# Variable for default node pools
variable "default_node_pool" {
  description = "Map of default node pool settings for each cluster"
  type = map(object({
    name       = string
    node_count = number
    vm_size    = string
  }))
}
