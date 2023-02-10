variable "vpn_ip" {
  default = "116.50.30.20/32"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "timeout" {
  type = number
}

variable "available_tzs" {
  type = list(string)
}

variable "size" {
  type = map(any)
  default = {
    0 = "t2.micro"
    1 = "t2.micro"
    2 = "t2.micro"
  }
}

variable "env_instance_type"{
  type = map(any)
  default = {
    default = "t2.micro"
    dev = "t2.micro"
    stg = "t2.micro"
    prod = "t2.micro"
  }
}

variable "env_names" {
  type    = list(string)
  default = ["dev", "stg", "prd"]
}

variable "security_group_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}

variable "security_group_ports_from_to" {
  type        = map(any)
  description = "list of ingress ports from to"
  default = {
    8200 = 8200,
    8201 = 8201,
    8300 = 8300,
    9200 = 9200,
    9500 = 9500
  }
}