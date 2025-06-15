#output "instance_amis" {
#  value = [for i in aws_instance.web : i.ami]
#}
#
#output "instance_arns" {
#  value = [for i in aws_instance.web : i.arn]
#}
#
#output "instance_public_dns" {
#  value = [for i in aws_instance.web : i.public_dns]
#}
