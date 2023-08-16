AWS Account: `ICANN DevOps QA`

Could not create s3 instance with the following error:

```
Error: creating EC2 Instance: VPCIdNotSpecified: No default VPC for this user. GroupName is only supported for EC2-Classic and default VPC. status code: 400, request id: 559dea12-6af8-4666-9f97-29b87cdb3799
with aws_instance.web
on main.tf line 17, in resource "aws_instance" "web":
```

There was no default VPC set, checked here:
https://us-west-2.console.aws.amazon.com/vpc/home?region=us-west-2#vpcs:

Could not create one, deleted the existing janky one and created a new default VPC and it all worked.

---

```
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "samuelson-terraform-20220826"
  acl    = "private"
}
```

```
resource "aws_s3_bucket" "example" {
  bucket = "learning-terraform.example.com"
  acl    = "public-read"
  policy = file("policy.json")
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket
  index_document {
    suffix = "index.html"
  }
}
```

---

```
resource "aws_vpc" "QA" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "Staging" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_vpc" "Prod" {
  cidr_block = "10.2.0.0/16"
}
```
---
```
resource "aws_security_group" "allow_tls" {
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["1.2.3.4/32"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }
}
```
Or defined separately:
```
resource "aws_security_group" "allow_tls" { }

resource "aws_security_group_rule" "https_inbound" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["1.2.3.4/32"]
  security_group_id = aws_security_group.allow_tls.id
}
```

---
```
resource "aws_instance" "blog" {
  ami           = data.aws_ami.ubuntu.id  # dynamic variable, rather than hardcoded
  instance_type = "t3.nano"
}
```

---
```
resource "aws_eip" "blog" { # we called this eip 'blog'
  instance = aws_instance.blog.id # by using a dynamic variable rather than a hardcoded one, we can delete the aws_instance, recreate it and terraform will continue to work as it updates the variable with the new instance id.
  vpc      = true
}
```

---
## Terraform Style

- Indent two spaces
- Single meta-arguments
  - Meta-arguments tell terraform what to do, they don't get passed directly to aws.
  - Eg `count = 2` tells it to create two instances, or you might specify precedence, or lifecycle.
- Block meta-arguments (go at end)
- Blank lines for clarity
- Group single arguments
- Line up the equal signs per section or block

```
resource "aws_instance" "web" {
  count = 2

  ami = "abc123"
  instance_type = "t2.micro"

  network_interface {
    # ...
  }

  # Block meta-arguaments should go at the end of a resource definition
  lifecycle {
    create_before_destroy = true
  }
}
```

---
## Terraform modules


Minimal required files to define a module:
- main.tf
- variables.tf
- outputs.tf
- README.md


```
module "web_server" {
  source = "./modules/servers"

  web_ami     = "ami-12345"
  server_name = "prod-web"
}
```

```
output "instance_public_ip" {
  value = aws_instance.web_app.public_ip
}

output "app_bucket" {
  value = aws_s3_bucket.web_app.bucket
}
```

```
resource "aws_route53_record" "www" {
  name    = "www.example.com"
  zone_id = aws_route53_zone.main.zone_id
  type    = "A"
  ttld    = "300"
  records = [module.web_server.public_ip]
}
```

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
}
