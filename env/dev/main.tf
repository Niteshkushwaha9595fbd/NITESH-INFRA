module "rgs" {
    source = "../../modules/azure_rg"
    rgs = var.rgs
    tags         = var.tags
  
}
