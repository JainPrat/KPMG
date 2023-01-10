variable "name" {
  type=string
}
variable "location" {
 type=string
}
variable "vnetcidr" {
 type=string
}
variable "websubnetcidr" {
  type=string
}
variable "appsubnetcidr" {
 type=string
}
variable "dbsubnetcidr" {
 type=string
}
variable "web_host_name"{
 type=string
}
variable "web_username" {
  type=string
}
variable "web_os_password" {
 type=string
}
variable "app_host_name"{
 type=string
}
variable "app_username" {
 type=string
}
variable "app_os_password" {
 type=string
}
variable "primary_database" {
 type=string
}
variable "primary_database_admin" {
 type=string
}
variable "primary_database_password" {
 type=string
}
variable "primary_database_version" {
 type=string
}
