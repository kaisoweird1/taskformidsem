provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "cd7ce892-0134-491f-81b8-d29b153b08b3"
}

module "networking" {
  source                = "../../modules/networking"
  env_tag               = "dev"
  region                = var.azure_region
  rg_name_override      = var.rg_name
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

module "nginx_app" {
  source      = "../../modules/nginx"
  environment = "dev"
}

module "compute" {
  source                    = "../../modules/compute"
  env_name                  = "dev"
  azure_region              = module.networking.location
  rg_name                   = module.networking.resource_group_name
  subnet_id                 = module.networking.private_subnet_id
  network_security_group_id = module.networking.nsg_id
  instance_size             = var.instance_type
  vm_admin_password         = var.vm_admin_password
  instance_count            = var.instance_count
  custom_data_script        = module.nginx_app.user_data_script
}

module "loadbalancer" {
  source           = "../../modules/loadbalancer"
  env_prefix       = "dev"
  azure_location   = module.networking.location
  rg_name          = module.networking.resource_group_name
  gateway_subnet_id = module.networking.public_subnet_id
  backend_vm_ips   = module.compute.private_ips
}