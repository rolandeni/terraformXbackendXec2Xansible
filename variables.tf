variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}
variable "instance_type" {}
variable "key" {}
variable "domain_name" {}
variable "inbound" {
  type    = list(number)
  default = [80, 443, 22]
}
# variable "key" {
#   type    = file
#   default = ~/key10.pem
# }
