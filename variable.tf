variable "vnet" {
 type=string
 default = "10.0.0.0/16"
}
variable "websubnet" {
  type=string
  default = "10.0.1.0/24"
}
variable "appsubnet" {
 type=string
 default = "10.0.2.0/24"
}
variable "dbsubnet" {
 type=string
 default = "10.0.3.0/24"
}
variable "web_host_name"{
 type=string
 default = "webhost"
}
variable "web_username" {
  type=string
  default = "user1"
}
variable "web_password" {
 type=string
 default = "pass1"
}
variable "app_host_name"{
 type=string
 default = "apphost"
}
variable "app_username" {
 type=string
 default = "user2"
}
variable "app_password" {
 type=string
 default = "pass2"
}
variable "database_name" {
 type=string
 default = "db1"
}
variable "database_admin" {
 type=string
 default = "localadmin"
}
variable "database_password" {
 type=string
 default = "localpass"
}

variable "server_name" {
 type=string
 default = "mssql"
}
