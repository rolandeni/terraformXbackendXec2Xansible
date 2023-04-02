#To create security group
resource "aws_security_group" "elb-sg" {
  name = "elb-sg"
  #incoming traffic
  dynamic "ingress" {
    for_each = var.inbound
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #replace with desired ip 
    }
  }
  #outgoing traffic all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #replace with desired ip
  }
}