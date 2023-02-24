
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

variable "env_instance_type" {
  type = map(any)
  default = {
    default = "t2.micro"
    dev     = "t2.micro"
    stg     = "t2.micro"
    prod    = "t2.micro"
  }
}

variable "env_names" {
  type    = list(string)
  default = ["dev", "stg", "prd"]
}
