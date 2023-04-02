
# output for ELB
output "aws_elb_dns" {
  description = "public ip of EC2"
  value       = aws_elb.balancer.dns_name
}
#output for instances
resource "local_file" "instance_public_ip" {
  filename = "host-inventory"
  content  = <<EOT
%{for ip_addr in aws_instance.server1.*.public_ip~}
${ip_addr}
%{endfor~}
EOT
  #To execute Ansible Script
  provisioner "local-exec" {
    command = "ansible-playbook  apache.yml -i host-inventory --user ubuntu --key-file ~/key10.pem"

  }

}
