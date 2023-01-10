resource "azurerm_sql_server" "test" {
    name = var.primary_database
    resource_group_name = var.resource_group
    location = var.location
    version = var.primary_database_version
    administrator_login = var.primary_database_admin
    administrator_login_password = var.primary_database_password
}

resource "azurerm_storage_account" "example" {
  name                     = "examplesa"
  resource_group_name      = ""
  location                 = ""
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_database" "testdb" {
  name                = "db"
  resource_group_name = var.resource_group
  location            = var.location
  server_name         = azurerm_sql_server.primary.name
}
