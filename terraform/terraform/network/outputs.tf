output "id" {
  value = module.network.sg_id
}

output "public_subnets" {
  value = module.network.vpc_public_subnets
}

output "vpc_id" {
  value = module.network.vpc_id
}
