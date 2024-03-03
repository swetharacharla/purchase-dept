variable "rgn-01" {
  description = "resource group name"
  type        = string
  default     = "procure-team"
}
variable "location" {
  description = "availability zone"
  type        = string
  default     = "australiaeast"
}
variable "vn-01" {
  description = "virtual network name"
  type        = string
  default     = "procure-vn"
}
variable "subnet-01" {
  description = "subnet name"
  type        = string
  default     = "procure-subnet"
}
variable "address_space" {
  description = "the address space for the virtual network"
  type        = list(any)
  default     = ["10.0.0.0/10"]
}
variable "address_prefixes" {
  description = "value"
  type        = list(any)
  default     = ["10.0.64.0/19"]

}
variable "nic-01" {
  description = "network interface name"
  type        = string
  default     = "procure-nic"
}
variable "ip-configuration" {
  description = "name of ip configurations"
  type        = string
  default     = "internal"
}
variable "linux-virtual-machine" {
  description = "name of the virtual machine"
  type        = string
  default     = "procure-linux-vm"
}
