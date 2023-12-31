variable "vpc_cidr" {
  
    description = "vpc cidr for jenkins"
    type = string
  
}

variable "public_subnets" {
    description = "subnets for public "
    type=list(string)
  
}

variable "instance_type" {
    description = "instance type for the jenkins server"
    type=string
  
}