locals {
  common_tags = {
    Name = "Automation Project – Assignment 2"
    GroupMembers = "Ayush Jain"
    ExpirationDate = "2022-04-22"
    Environment = "Lab"
  }
}

variable "log_analytics_workspace" {
  type = map(string)
  default = {
    law_name  = "lawayush"
    log_sku   = "PerGB2018"
    retention = "30"
  }
}

variable "resource_group" {}
variable "location" {}
variable "rg_group" {}