output "sg_id" {
  value = module.security-group.security_group_id
}

output "vpc_public_subnets" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
