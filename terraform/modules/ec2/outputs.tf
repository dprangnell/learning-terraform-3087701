output "instance_amis" {
  value = [for i in aws_instance.web : i.ami]
}

output "instance_arns" {
  value = [for i in aws_instance.web : i.arn]
}
