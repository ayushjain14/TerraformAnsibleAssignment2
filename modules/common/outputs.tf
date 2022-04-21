output "law_name" {
  value = azurerm_log_analytics_workspace.la_workspace.name
}

output "rv_name" {
  value = azurerm_recovery_services_vault.vault.name
}

output "sa_name" {
  value = azurerm_storage_account.storage_acc.name
}
