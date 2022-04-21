#Resoruce Group output
output "rg_group" {
  value = module.rgroup.rg_group.name
}

#Nwtwork Output
output "vnet_name" {
  value = module.network.vnet_name
}
output "subnet1_name" {
  value = module.network.subnet1_name
}
#Common Output
output "law_name" {
  value = module.common.law_name
}
output "rv_name" {
  value = module.common.rv_name
}
output "sa_name" {
  value = module.common.sa_name
}
#Linux Outputs
output "linux_hostnames" {
  value = [module.vmlinux.linux_hostnames]
}
output "linux_private_ip_addresses" {
  value = [module.vmlinux.linux_private_ip_addresses]
}
output "linux_public_ip_addresses" {
  value = [module.vmlinux.linux_public_ip_addresses]
}

#Windows Outputs
output "Windows_hostnames" {
  value = [module.vmwindows.windows_hostnames]
}
output "Windows_private_ip_addresses" {
  value = [module.vmwindows.windows_private_ip_addresses]
}
output "Windows_public_ip_addresses" {
  value = [module.vmwindows.windows_public_ip_addresses]
}

#Loadbalancer Outputs
output "lb_name" {
  value = module.loadbalancer.lb_name.name
}

#Database Outputs
output "db_name" {
  value = module.database.db_name.name
}