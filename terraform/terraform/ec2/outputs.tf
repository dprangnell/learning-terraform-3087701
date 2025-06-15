#output "instance_amis" {
#  #value = [for i in module.ec2: i.instance_amis]
#  value = module.ec2.instance_amis
#}
#
#output "instance_arns" {
#  #value = [for i in module.ec2 : i.instance_arns]
#  value = module.ec2.instance_arns
#}
#
#output "instance_public_dns" {
#  value = module.ec2.instance_public_dns
#}
