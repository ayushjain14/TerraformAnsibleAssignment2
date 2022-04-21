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
variable "linux_id" {}
variable "windows_name" {}
variable "windows_id" {}