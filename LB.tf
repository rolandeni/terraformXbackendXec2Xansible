
#create a new loadbalancer
resource "aws_elb" "balancer" {
  name               = "lb-balancer"
  availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  ## elb attachments
  instances                 = aws_instance.server1.*.id
  cross_zone_load_balancing = true
  idle_timeout              = 40
  tags = {
    name = "demo-elb"
  }
}
