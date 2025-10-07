provider "azurerm" {
  features {}
}

module "networking" {
  source                = "../../modules/networking"
  env_tag               = "prod"
  region                = var.azure_region
  rg_name_override      = var.rg_name
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

module "nginx_app" {
  source      = "../../modules/nginx"
  environment = "prod"
}

module "compute" {
  source                    = "../../modules/compute"
  env_name                  = "prod"
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
  source            = "../../modules/loadbalancer"
  env_prefix        = "prod"
  azure_location    = module.networking.location
  rg_name           = module.networking.resource_group_name
  gateway_subnet_id = module.networking.public_subnet_id
  backend_vm_ips    = module.compute.private_ips
}