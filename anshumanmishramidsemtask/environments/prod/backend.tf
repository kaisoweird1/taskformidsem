terraform {
  backend "azurerm" {
    resource_group_name  = "kairg2"
    storage_account_name = "omgohnogngwth"
    container_name       = "nonoplspls"
    key                  = "vnet-compute/prod.terraform.tfstate"
    use_azuread_auth     = true
  }
}