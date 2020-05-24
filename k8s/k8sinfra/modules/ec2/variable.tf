variable "region" {
  default = "us-east-2"
}
variable "amiid" {
  type = "string"
  #default = {
   # us-east-2 = "ami-0fc20dd1da406780b"
   #us-east-1 = "ami-0400a1104d5b9caa1"
   # us-west-1 = "ami-03ba3948f6c37a4b0"
 # }
  description = "You may added more regions if you want"
}

variable "instance_count" {
 type = "string"
#default = "3"
}
variable "instance_type" {
  type = "string"
 # default = "t2.micro"
}
variable "key_name" {
  type = "string"
  #default = "srimul"
  description = "the ssh key to be used for the EC2 instance"
}

variable "instance_tags" {
  type = "string"
  #default = ["Ansible-Master", "Ansible-Node1","Ansible-Node2"]
}
variable "security_group" {
default = "sg-06b2e5950e8c41e0d"
  description = "Security groups for the instance"
}
variable "vpc_security_group_ids" {
 type = "string"
}
#variable "user_data" {
# type = "string"
#}   
