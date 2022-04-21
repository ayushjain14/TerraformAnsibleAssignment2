locals {
  common_tags = {
    Name = "Automation Project – Assignment 2"
    GroupMembers = "Ayush Jain"
    ExpirationDate = "2022-04-22"
    Environment = "Lab"
  }
}
variable "resource_group" {}
variable "location" {}
variable "rg_group" {}
variable "linux_name" {}
variable "subnet1_id" {}
variable "nb_count" {}
variable "linux_avset" {}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "linux_admin_user" {
  default = "n01476579"
}

variable "pub_key" {
  default = "/home/n01476579/.ssh/id_rsa.pub"
}
variable "priv_key" {
  default = "/home/n01476579/.ssh/id_rsa"
}
variable "los_disk_attr" {
  type = map(string)
  default = {
    los_storage_account_type = "Premium_LRS"
    los_disk_size            = "32"
    los_disk_caching         = "ReadWrite"
  }
}

variable "linux_publisher" {
  default = "OpenLogic"
}
variable "linux_offer" {
  default = "CentOS"
}
variable "linux_sku" {
  default = "8_2"
}
variable "linux_version" {
  default = "8.2.2020111800"
}

variable "linux_id" {}
