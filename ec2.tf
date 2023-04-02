#creating AWS instances
resource "aws_instance" "server1" {

  ami             = "ami-00149760ce42c967b"
  instance_type   = var.instance_type
  key_name        = var.key
  count           = 4
  security_groups = ["elb-sg"]
  user_data       = <<EOF
  #!/bin/bash
  sudo apt update &&& sudo apt upgrade
  sudo apt install apache2 -y
  sudo ufw allow 'Apache'  
  sudo systemctl start apache2 
  sudo echo "welcome to my demoserver" > /var/www/html/index.html
EOF
  tags = {
    name   = "demo server1"
    source = "terraform"
  }
}
