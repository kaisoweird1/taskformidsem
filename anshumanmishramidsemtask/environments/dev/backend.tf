terraform {
  backend "azurerm" {
    resource_group_name  = "kaika-rg"
    storage_account_name = "ohnogngwth"
    container_name       = "nopls"
    key                  = "vnet-compute/dev.terraform.tfstate"
    use_azuread_auth     = true
  }
}