variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}

variable "REGION"{
  default = "us-west-2"
}

variable "AMIS"{
 type = "map"
 
 default {
   "us-west-2" = "ami-6df1e514"
   "eu-west-1" = "ami-d7b9a2b1"
 }

}