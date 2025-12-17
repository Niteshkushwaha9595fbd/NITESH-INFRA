module "rgs" {
    source = "../../modules/azure_rg"
    rgs = var.rgs
    tags         = var.tags
  
}
# module "public_ip" {
#     source = "../../modules/azure_public_ip"
#     pip          = var.pip
#     tags         = var.tags
#     depends_on = [ module.rgs ]

    
  
# } 

module "vnet" {
  source = "../../modules/vnet"
  vnet = var.vnet
  tags         = var.tags
  depends_on = [ module.rgs ]
  
}

# module "nic" {
#   source = "../../modules/azure_networking"
#   nic = var.nic
#   tags         = var.tags
#   depends_on = [ module.vnet , module.rgs, module.subnet ]
  
# }
module "subnet" {
  
  source = "../../modules/subnet"
  subnet = var.subnet
  depends_on = [ module.vnet , module.rgs ]
 
  
}

# module "vms" {
#   source = "../../modules/azure_computing"
#   vms = var.vms
#   depends_on = [ module.rgs,module.nic,module.public_ip,module.subnet,module.vnet ]
  
# }


module "acr" {
  source = "../../modules/acr"
  acr = var.acr
  depends_on = [ module.rgs ]

  
}

module "vault" {
  source = "../../modules/vault"
  vault = var.vault
  depends_on = [ module.rgs ]
  
}
module "stg" {
  source = "../../modules/storage"
  stg = var.stg
  depends_on = [ module.rgs , module.vnet , module.subnet ]
  
}

module "aks" {
  source = "../../modules/aks"
  aks = var.aks
  default_node_pool = var.default_node_pool
  depends_on = [ module.rgs ]
  
}

module "sql_db" {
 source = "../../modules/mysql_db"
 db = var.db
  server_ids = module.sql_server.server_ids
 depends_on = [module.sql_server]  
}

module "sql_server" {
  source = "../../modules/sql_server"
  sql_server = var.sql_server
  depends_on = [ module.rgs ]
  
}