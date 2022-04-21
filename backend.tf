terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate6579-RG"
    storage_account_name = "tfstate6579sa"
    container_name       = "tfstatefiles6579"
    key                  = "lab.terraform.tfstate"
  }
}