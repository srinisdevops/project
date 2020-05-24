provider "aws" {
   region = "us-east-2"
}

## Belwo output statement is to expose ASG Launch config through module
## This is a way to return values from a modules
output "ansible_public_ip" {

value = "${aws_instance.cZServers.*.public_ip}"
}
output "ansible_instance_id" {
  value = "${aws_instance.cZServers.*.id}"
}
resource "aws_instance" "cZServers" {
  ami = "${var.amiid}"
  instance_type = "${var.instance_type}"
  count = "${var.instance_count}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  tags = {
    Name  = "${var.instance_tags}-${count.index + 1}"
  }

  key_name = "${var.key_name}"

# user_data = "${var.user_data}"
  
#  provisioner "file" {
#    source      = "/home/ubuntu/Keys/MyKeyPair.pem"
#    destination = "/tmp/MyKeyPair.pem"
#    destination = "/home/ubuntu/Keys/MyKeyPair.pem"
# }
#  connection {
#    host     = "${self.public_ip}"
#    type     = "ssh"
#    user     = "ubuntu"
#    password = ""
#    private_key = "${file("/home/ubuntu/Keys/MyKeyPair.pem")}"
#}
}
