locals {
  common_tags = {
    Name = "Automation Project – Assignment 2"
    GroupMembers = "Ayush Jain"
    ExpirationDate = "2022-04-22"
    Environment = "Lab"
  }
}
variable "windows_name" {
  type = map(string)
}
variable "windows_avset" {}
variable "location" {}
variable "resource_group" {}
variable "subnet1_id" {}
variable "rg_group" {}

variable "windows_admin_user" {
  default = "n01476579"
}

variable "admin_password" {
  default = "Humber@6579"
}

variable "wos_disk_attr" {
  type = map(string)

  default = {
    wos_storage_account_type = "StandardSSD_LRS"
    wos_disk_size            = "127"
    wos_disk_caching         = "ReadWrite"
  }
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2016-Datacenter"
}

variable "windows_version" {
  default = "latest"
}
