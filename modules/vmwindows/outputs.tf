output "windows_hostnames" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].name
}

output "windows_private_ip_addresses" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].private_ip_address
}

output "windows_public_ip_addresses" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].public_ip_address
}

output "windows_id" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].id
}