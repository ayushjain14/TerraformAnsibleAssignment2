resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.vmlinux, azurerm_virtual_machine_data_disk_attachment.linux_attachment
  ]
  triggers = {

    network_interface_ids = join(",", azurerm_network_interface.linux_nic[*].id)

 }

  provisioner "local-exec" {
    command = "sleep 15; ansible-playbook playbook.yaml"
    connection {
      type        = "ssh"
      user        = var.linux_admin_user
      private_key = file(var.priv_key)
      #host        = element(azurerm_public_ip.linux_pip[*].fqdn, count.index + 1)
      host = element(azurerm_linux_virtual_machine.vmlinux[*].public_ip_address, count.index + 1)
    }
  }

  
}
