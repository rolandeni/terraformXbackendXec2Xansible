# To create a hosted zone in route 53
resource "aws_route53_zone" "zone1" {
  name = var.domain_name
}
#to use a hosted zone
#data "aws_route53_zone" "zone1"  {
#  name = var.domain_name 
#}

# #To create a record
# resource "aws_route53_record" "myrecord" {
#   zone_id = data.aws_route53_zone.zone1.zone_id
#   name    = var.record_name
#   type    = "A"
#   alias {
#     name                   = aws_elb.balancer.dns_name
#     zone_id                = aws_elb.balancer.zone_id
#     evaluate_target_health = true
#   }
# }