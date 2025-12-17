terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    
    resource_group_name              = "niteshcontainer"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name             = "stgnitesh2"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name                   = "niteshcontainer"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                              = "tf.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

  


provider "azurerm" {
  features {}
  subscription_id = "49c47d3a-ee46-467f-b8ac-06b906f03845"
  resource_provider_registrations = "none"
}
