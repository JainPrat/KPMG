
module "resourcegroup" {
  source         = "./modules/resourcegroup"
  name           = "rgtest"
  location       = "northeurope"
}

module "vnet" {
  source              = "./modules/vnet"
  name                = "vmtest"
  location            = module.resourcegroup.location_id
  resource_group      = module.resourcegroup.resource_group_name
  address_space       = var.vnet
}

module "websubnet" {
  source         = "./modules/subnet"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetname       = module.vnet.vnet_name
  address_prefixes  = var.websubnet
}

module "appsubnet" {
  source         = "./modules/subnet"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetname       = module.vnet.vnet_name
  address_prefixes  = var.appsubnet
}

module "dbsubnet" {
  source         = "./modules/subnet"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetname       = module.vnet.vnet_name
  address_prefixes   = var.dbsubnet
}

module "nsg" {
  source         = "./modules/nsg"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  web_subnet_id  = module.websubnet.subnet_id
  app_subnet_id  = module.appsubnet.subnet_id
  db_subnet_id   = module.dbsubnet.subnet_id
}


module "webvm" {
  source         = "./modules/vm"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  subnet_id = module.websubnet.websubnet_id
  host_name = var.web_host_name
  username = var.web_username
  password = var.web_password
}

module "appvm" {
  source         = "./modules/vm"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  subnet_id = module.appsubnet.appsubnet_id
  host_name = var.app_host_name
  username = var.app_username
  password = var.app_password
}

module "database" {
  source = "./modules/database"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  sqlserver_name =var.server_name
  database_name = var.database_name
  database_admin = var.database_admin
  database_password = var.database_password
}
