resource "azurerm_sql_server" "test" {
    name = var.server_name
    resource_group_name = var.resource_group
    location = var.location
    version  = "12.0"
    administrator_login = var.database_admin
    administrator_login_password = var.database_password
}

resource "azurerm_storage_account" "example" {
  name                     = "examplesa"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_database" "testdb" {
  name                = "db"
  resource_group_name = var.resource_group
  location            = var.location
  server_name         = azurerm_sql_server.test.name
}
