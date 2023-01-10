
module "resourcegroup" {
  source         = "./modules/resourcegroup"
  name           = var.name
  location       = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  location            = module.resourcegroup.location_id
  resource_group      = module.resourcegroup.resource_group_name
  address_space       = var.vnet
}

module "websubnet" {
  source         = "./modules/subnet"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetname       = var.vnet_name
  address_prefixes  = var.websubnet
}

module "appsubnet" {
  source         = "./modules/subnet"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetname       = var.vnet_name
  address_prefixes  = var.appsubnet
}

module "dbsubnet" {
  source         = "./modules/subnet"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetname       = var.vnet_name
  address_prefixes   = var.dbsubnet
}

module "webnsg" {
  source         = "./modules/nsg"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  web_subnet_id  = module.subnet.websubnet_id
}

module "appnsg" {
  source         = "./modules/nsg"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  app_subnet_id  = module.subnet.appsubnet_id
}

module "dbnsg" {
  source         = "./modules/nsg"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  db_subnet_id   = module.subnet.dbsubnet_id
}

module "webvm" {
  source         = "./modules/vm"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  web_subnet_id = module.websubnet.websubnet_id
  web_host_name = var.web_host_name
  web_username = var.web_username
  web_password = var.web_password
}

module "appvm" {
  source         = "./modules/vm"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  app_subnet_id = module.appsubnet.appsubnet_id
  app_host_name = var.app_host_name
  app_username = var.app_username
  app_password = var.app_password
}

module "database" {
  source = "./modules/database"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  sqlserver_name =var.server_name
  database_name = var.database_name
  database_version = var.database_version
  database_admin = var.database_admin
  database_password = var.database_password
}
