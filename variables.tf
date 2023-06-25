variable "project_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "tcc-tf"
}

variable "cfg_region2" {  
  type = map
  default = {
    "region" = "us-east-2"
    "ami" = "ami-0430580de6244e02e"
    "key_name" = "terraform-aws"
  }

  description = "config for region 2, parallel to region"
}

variable "cfg_region1" {
  type = map
  default = {
    "region" =  "us-east-1"
    "ami" = "ami-090e0fc566929d98b" #amazon linux 2 useast1
    "key_name"  = "terraform-aws"
  }

  description = "config for region 1, parallel to region"
}

variable "machine_type" {
  type = map
  default = {
      "dev_machine_type"  = "t2.micro"
      "prod_machine_type"  = "t2.micro"  
  }
}

locals {
  description = "locals for region 2"
  key_name  = "terraform-aws"
}