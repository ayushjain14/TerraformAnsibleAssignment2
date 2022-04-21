module "rgroup" {
  source   = "./modules/rgroup"
  rg_group = "6579-assignment2-RG"
  location = "Central US"
}

module "network" {
  source         = "./modules/network"
  rg_group       = "6579-assignment2-RG"
  resource_group = module.rgroup.rg_group.name
  location       = module.rgroup.rg_group.location
  vnet           = "vnet1"
  vnet_space     = ["10.0.0.0/16"]
  subnet1        = "subnet1"
  subnet1_space  = ["10.0.1.0/24"]
  nsg1           = "nsg1"
}

module "common" {
  source         = "./modules/common"
  rg_group       = "6579-assignment2-RG"
  resource_group = module.rgroup.rg_group.name
  location       = module.rgroup.rg_group.location
  depends_on = [
    module.rgroup
  ]
}

module "vmlinux" {
  source         = "./modules/vmlinux"
  rg_group       = "6579-assignment2-RG"
  linux_name     = "terraform-u-vm"
  linux_avset    = "linux-avs"
  nb_count       = 2
  resource_group = module.rgroup.rg_group.name
  location       = module.rgroup.rg_group.location
  linux_id       = module.vmlinux.linux_id
  subnet1_id     = module.network.subnet1_id
  depends_on     = [module.network]
}

module "vmwindows" {
  source   = "./modules/vmwindows"
  rg_group = "6579-assignment2-RG"

  windows_avset = "windows-avs"
  windows_name = {
    terraform-w-vm1 = "Standard_B1s"
  }
  location       = module.rgroup.rg_group.location
  resource_group = module.rgroup.rg_group.name
  subnet1_id     = module.network.subnet1_id
  depends_on     = [module.network]
}

module "datadisk" {
  source         = "./modules/datadisk"
  rg_group       = "6579-assignment2-RG"
  location       = module.rgroup.rg_group.location
  resource_group = module.rgroup.rg_group.name
  linux_name     = "terraform-u-vm"
  linux_id       = module.vmlinux.linux_id
  windows_id     = module.vmwindows.windows_id
  windows_name = {
    terraform-w-vm1 = "Standard_B1s"
  }
  depends_on = [
    module.vmlinux,
    module.vmwindows
  ]
}

module "loadbalancer" {
  source         = "./modules/loadbalancer"
  rg_group       = "6579-assignment2-RG"
  location       = module.rgroup.rg_group.location
  resource_group = module.rgroup.rg_group.name
  subnet1_id     = module.network.subnet1_id
  linux_nic      = module.vmlinux.linux_nic
  depends_on = [
    module.network,
    module.vmlinux
  ]
}

module "database" {
  source         = "./modules/database"
  rg_group       = "6579-assignment2-RG"
  location       = module.rgroup.rg_group.location
  resource_group = module.rgroup.rg_group.name
  depends_on = [
    module.rgroup
  ]
}