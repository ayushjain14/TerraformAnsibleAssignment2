resource "azurerm_postgresql_server" "psqls" {
  name                = "postgresql-server-ayush6579"
  location            = var.location
  resource_group_name = var.rg_group

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "ayush6579"
  administrator_login_password = "Ayush@6579"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
  tags                         = local.common_tags
}

resource "azurerm_postgresql_database" "psqldb" {
  name                = "psql-db6579"
  resource_group_name = var.rg_group
  server_name         = azurerm_postgresql_server.psqls.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
  depends_on = [
    azurerm_postgresql_server.psqls
  ]
}