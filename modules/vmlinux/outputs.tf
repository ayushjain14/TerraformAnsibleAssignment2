output "linux_hostnames" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].name]
}

output "linux_private_ip_addresses" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].private_ip_address]
}

output "linux_public_ip_addresses" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].public_ip_address]
}

output "Linux_domain_names" {
  value = [azurerm_public_ip.linux_pip[*].fqdn]
}

output "linux_id" {
  value = azurerm_linux_virtual_machine.vmlinux[*].id
}

output "linux_nic" {
  value = azurerm_network_interface.linux_nic[*]
}
