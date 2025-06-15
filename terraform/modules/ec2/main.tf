module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "8.3.0"

  name     = "example-asg"
  min_size = 1
  max_size = 2

  vpc_zone_identifier = data.terraform_remote_state.vpc.outputs.public_subnets
  security_groups     = [data.terraform_remote_state.security_group.outputs.id]

  image_id      = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  traffic_source_attachments = {
    ex-alb = {
      traffic_source_identifier = module.alb.target_groups["ex_asg"].arn
      traffic_source_type       = "elbv2" # default
    }
  }
}


module "alb" {
  source = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name    = "my-alb"

  vpc_id  = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = data.terraform_remote_state.vpc.outputs.public_subnets

  enable_deletion_protection = false

  security_groups = [data.terraform_remote_state.security_group.outputs.id]

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"

      forward = {
        target_group_key = "ex_asg"
      }
    }
  }

  target_groups = {
    ex_asg = {
      name_prefix = "blog-"
      protocol    = "HTTP"
      port        = 80
      target_type = "instance"
      load_balancing_cross_zone_enabled = true

      # There's nothing to attach here in this definition.
      # The attachment happens in the ASG module above
      create_attachment = false
    }
  }

  tags = local.combined_tags
}
