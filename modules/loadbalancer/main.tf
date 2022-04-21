resource "azurerm_public_ip" "lbpubip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg_group
  allocation_method   = "Static"
  tags                = local.common_tags
}

resource "azurerm_lb" "lbassignment" {
  name                = "LoadBalancer6579"
  location            = var.location
  resource_group_name = var.rg_group
  tags                = local.common_tags
  frontend_ip_configuration {
    name                 = "PublicIPAddresslb"
    public_ip_address_id = azurerm_public_ip.lbpubip.id
  }
}
resource "azurerm_lb_backend_address_pool" "lbbap" {
  loadbalancer_id = azurerm_lb.lbassignment.id
  name            = "BackEndAddressPool"
}



resource "azurerm_network_interface_backend_address_pool_association" "nibapa" {
  count                   = length(var.linux_nic)
  network_interface_id    = element(var.linux_nic[*].id, count.index)
  ip_configuration_name   = element(var.linux_nic[*].ip_configuration[0].name, count.index)
  backend_address_pool_id = azurerm_lb_backend_address_pool.lbbap.id
}

resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = var.rg_group
  loadbalancer_id                = azurerm_lb.lbassignment.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddresslb"
}

resource "azurerm_lb_probe" "lb_probe" {
  resource_group_name = var.rg_group
  loadbalancer_id     = azurerm_lb.lbassignment.id
  name                = "ssh-running-probe"
  port                = 22
}