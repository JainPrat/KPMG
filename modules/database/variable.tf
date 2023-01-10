variable "database_name" {
 type=string
}
variable "database_admin" {
 type=string
}
variable "database_password" {
 type=string
}

variable "server_name" {
 type=string
}

variable "resource_group" {
 type=string
 default = "testrg"
}

variable "location" {
 type=string
 default = "northeurope"
}
