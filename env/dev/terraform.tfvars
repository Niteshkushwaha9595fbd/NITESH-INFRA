# tags = {
#   environment = "dev"
#   owner       = "devops-team"
# }

 rgs = {
   "rg1" = {
     rg_name  = "jenkinsrg"
     location = "eastus"
   }
}
#   "rg2" = {
#     rg_name  = "rg-example-2"
#     location = "westus"
#   }
# }
# pip = {
#   pip1 = {
#     rg_name  = "rg-example-1"
#     location = "East US"
#     pip_name = "public-ip-1"
#     optional = {
#       allocation_method       = "Static"
#       idle_timeout_in_minutes = 10
#       sku                     = "Standard"
#       sku_tier                = "Regional"
#     }
#   }

#   pip2 = {
#     rg_name  = "rg-example-2"
#     location = "westus"
#     pip_name = "public-ip-2"
#     optional = {
#       allocation_method       = "Static"
#       ddos_protection_mode    = "Disabled"
#       domain_name_label        = "examplelabel"
#       ip_version              = "IPv4"
#     }
#   }

  
# }

# vnet = {
#   vnet1 = {
#     vnet_name     = "vnet-example-1"
#     location      = "East US"
#     rg_name       = "rg-example-1"
#     address_space = ["10.0.0.0/16"]
#     # dns_servers   = ["10.1.0.4", "10.1.0.5"]
#   }

#   vnet2 = {
#     vnet_name     = "vnet-example-2"
#     location      = "West US"
#     rg_name       = "rg-example-2"
#     address_space = ["10.2.0.0/16"]
#     # dns_servers not provided, will use default []
#   }
# }

# subnet = {
#   subnet1 = {
#     subnet_name      = "subnet-example-1"
#     rg_name          = "rg-example-1"
#     vnet_name        = "vnet-example-1"
#     address_prefixes = ["10.0.1.0/24"]
#   }

#   subnet2 = {
#     subnet_name      = "subnet-example-2"
#     rg_name          = "rg-example-2"
#     vnet_name        = "vnet-example-2"
#     address_prefixes = ["10.2.1.0/24"]
#   }

  
# }

# nic = {
#   nic1 = {
#     nic_name    = "nic-example-1"
#     location    = "East US"
#     rg_name     = "rg-example-1"
#     vnet_name   = "vnet-example-1"
#     subnet_name = "subnet-example-1"
#     private_ip_allocation = "Dynamic"
#   }

#   nic2 = {
#     nic_name    = "nic-example-2"
#     location    = "West US"
#     rg_name     = "rg-example-2"
#     vnet_name   = "vnet-example-2"
#     subnet_name = "subnet-example-2"
#     private_ip_allocation = "Static"
#   }
# }

# ---------- Global Tags ----------
tags = {
  environment = "dev"
  owner       = "devops-team"
}

# ---------- Resource Groups ----------
rgs = {
  "rg1" = {
    rg_name  = "rg-example-1"
    location = "eastus"
  }
  # "rg2" = {
  #   rg_name  = "rg-example-2"
  #   location = "westus"
  # }
}

# ---------- Public IPs ----------
pip = {
  pip1 = {
    rg_name  = "rg-example-1"
    location = "East US"
    pip_name = "public-ip-1"
    optional = {
      allocation_method       = "Static"
      idle_timeout_in_minutes = 10
      sku                     = "Standard"
      sku_tier                = "Regional"
    }
  }

  pip2 = {
    rg_name  = "rg-example-2"
    location = "westus"
    pip_name = "public-ip-2"
    optional = {
      allocation_method       = "Static"
      ddos_protection_mode    = "Disabled"
      domain_name_label       = "examplelabel"
      ip_version              = "IPv4"
    }
  }
}

# ---------- Virtual Networks ----------
vnet = {
  vnet1 = {
    vnet_name     = "vnet-example-1"
    location      = "East US"
    rg_name       = "rg-example-1"
    address_space = ["10.0.0.0/16"]
  }

#   vnet2 = {
#     vnet_name     = "vnet-example-2"
#     location      = "West US"
#     rg_name       = "rg-example-2"
#     address_space = ["10.2.0.0/16"]
#   }
}

# ---------- Subnets ----------
subnet = {
  subnet1 = {
    subnet_name      = "subnet-example-1"
    rg_name          = "rg-example-1"
    vnet_name        = "vnet-example-1"
    address_prefixes = ["10.0.1.0/24"]
  }

#   subnet2 = {
#     subnet_name      = "subnet-example-1"
#     rg_name          = "rg-example-2"
#     vnet_name        = "vnet-example-2"
#     address_prefixes = ["10.2.1.0/24"]
#   }
}

# ---------- Network Interfaces ----------
nic = {
  nic1 = {
    nic_name             = "nic-example-1"
    location             = "east us"
    rg_name              = "rg-example-1"
    vnet_name            = "vnet-example-1"
    subnet_name          = "subnet-example-1"
    private_ip_allocation = "Dynamic"
    public_ip_name = "public-ip-1"
   
  }

  nic2 = {
    nic_name             = "nic-example-2"
    location             = "West US"
    rg_name              = "rg-example-2"
    vnet_name            = "vnet-example-2"
    subnet_name          = "subnet-example-2"
    private_ip_allocation = "Static"
    public_ip_name = "public-ip-2"
    
  }
}

# ---------- Virtual Machines ----------
vms = {
  vm1 = {
    vm_name      = "vm-app-eastus"
    rg_name      = "rg-example-1"
    location     = "east us"
    size         = "Standard_L2aos_v4"   # Updated from B1s to B2s
    username     = "azureuser"
    password     = "P@ssword1234!"
    nic_name     = "nic-example-1"

    os_disks = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 64
        name                 = "osdisk-eastus"
      }
    ]

    image_ref = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts-gen2"
        version   = "latest"
      }
    ]

    tags = {
      "Environment" = "Dev"
      "App"         = "Frontend"
    }
  }

  vm2 = {
    vm_name      = "vm-db-westus"
    rg_name      = "rg-example-1"
    location     = "westus"
    size         = "Standard_B1ms"
    username     = "azureuser"
    password     = "P@ssword1234!"
    nic_name     = "nic-example-2"

    os_disks = [
      {
        caching              = "ReadOnly"
        storage_account_type = "Premium_LRS"
        disk_size_gb         = 128
        name                 = "osdisk-westus"
      }
    ]

    image_ref = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    ]

    tags = {
      "Environment" = "Dev"
      "App"         = "Database"
    }
  }
}

acr = {
  acr1 = {
    acr_name = "acrprojecteastus"
    rg_name  = "rg-example-1"
    location = "eastus"
  }

  # acr2 = {
  #   acr_name = "acrprojectwestus"
  #   rg_name  = "rg-example-2"
  #   location = "westus"
  # }
}
vault = {
  kv1 = {
    vault_name                 = "kv-example-eastus"
    rg_name                    = "rg-example-1"
    location                   = "eastus"
    soft_delete_retention_days = 7
    purge_protection_enabled   = true
  }

  # kv2 = {
  #   vault_name                 = "kv-example-westus"
  #   rg_name                    = "rg-example-1"
  #   location                   = "westus"
  #   soft_delete_retention_days = 14
  #   purge_protection_enabled   = false
  # }
}
stg = {
  stg1 = {
    stg_name    = "stgexampleeastus"
    rg_name     = "rg-example-1"
    location    = "eastus"
    vnet_name   = "vnet-example-1"
    subnet_name = "subnet-example-1"
  }

  # stg2 = {
  #   stg_name    = "stgexamplewestus"
  #   rg_name     = "rg-example-2"
  #   location    = "westus"
  #   vnet_name   = "vnet-example-2"
  #   subnet_name = "subnet-example-2"
  # }
}
aks = {
  aks1 = {
    aks_name  = "prod-aks-01"
    location  = "eastus"
    rg_name   = "rg-example-1"
    kubernetes_version = "1.34.1"
  }
}

 

default_node_pool = {
  aks1 = {
    name       = "agentpool"
    node_count = 1
    vm_size    = "standard_dc2ds_v3"
  }
}

# db = {
#   db1 = {
#     db_name = "appdb1"
#   }
#   db2 = {
#     db_name = "appdb2"
#   }
# }
# sql_server = {
#   server1 = {
#     sql_server_name = "sqlserver-dev-01"
#     rg_name         = "rg-example-1"
#     location        = "Central India"
#   }

#   server2 = {
#     sql_server_name = "sqlserver-prod-01"
#     rg_name         = "rg-example-1"
#     location        = "East US"
#   }
# }

sql_server = {
  server1 = { sql_server_name = "sqlserver-niteshdev-ci", rg_name = "rg-example-1", location = "centralindia" }
  # server2 = { sql_server_name = "sqlserver-prod", rg_name = "rg-example-1", location = "East US" }
}















db = {
  db1 = { db_name = "appdb1", server_key = "server1" }
  # db2 = { db_name = "appdb2", server_key = "server2" }
}
