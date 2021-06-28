/* output "ssh" {
  value = "sudo ssh -i ./ssh-keys/ec2_ssh_key ubuntu@${module.ec2.public_dns}"
}

output "http" {
  value = "http://${module.ec2.public_ip}"
}

output "ssh_2" {
  value = "sudo ssh -i ./ssh-keys/ec2_ssh_key2 ubuntu@${module.ec2_without_ebs.public_dns}"
}

output "http_2" {
  value = "http://${module.ec2_without_ebs.public_ip}"
} */

output "alb-url" {
    value = module.ec2_with_lb.dns_name
}