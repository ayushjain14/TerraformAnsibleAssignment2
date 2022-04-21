resource "azurerm_managed_disk" "linux_disk" {
  count                = 2
  name                 = "${element(var.linux_name[*], count.index + 1)}-datadisk${format("%1d", count.index + 1)}"
  location             = var.location
  resource_group_name  = var.rg_group
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = local.common_tags
}
resource "azurerm_virtual_machine_data_disk_attachment" "linux_attachment" {
  count              = 2
  managed_disk_id    = element(azurerm_managed_disk.linux_disk[*].id, count.index + 1)
  virtual_machine_id = element(var.linux_id[*], count.index + 1)
  lun                = 1
  caching            = "ReadWrite"
  depends_on         = [azurerm_managed_disk.linux_disk]
}

resource "azurerm_managed_disk" "windows_disk" {
  for_each = var.windows_name
  name     = "${each.key}-datadisk3"
  #name                 = var.windows_name-datadisk3
  location             = var.location
  resource_group_name  = var.rg_group
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = local.common_tags
}
resource "azurerm_virtual_machine_data_disk_attachment" "windows_attachment" {
  for_each           = var.windows_name
  managed_disk_id    = azurerm_managed_disk.windows_disk[each.key].id
  virtual_machine_id = var.windows_id[0]
  lun                = 0
  caching            = "ReadWrite"
  depends_on         = [azurerm_managed_disk.windows_disk]
}