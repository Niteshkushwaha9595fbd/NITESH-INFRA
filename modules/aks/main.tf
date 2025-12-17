resource "azurerm_kubernetes_cluster" "example" {
  for_each            = var.aks
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = "exampleaks1"
  # ✅ AKS Kubernetes version
  kubernetes_version = lookup(each.value, "kubernetes_version", null)

  # ✅ Correct dynamic block syntax
  dynamic "default_node_pool" {
    for_each = var.default_node_pool
    content {
      name       = lookup(default_node_pool.value, "name", "default")
      node_count = lookup(default_node_pool.value, "node_count", 1)
      vm_size    = lookup(default_node_pool.value, "vm_size", "Standard_D2_v2")
    }
  }

  identity {
    type = "SystemAssigned"
  }
    # ✅ Enable OIDC issuer
  oidc_issuer_enabled = true

  tags = {
    Environment = "Production"
  }
}



