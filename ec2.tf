provider "aws"{
    region="eu-west-2"
}

module "ec2"{
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = local.ec2s

  name = lookup(each.value, "ec2_name")

  ami                    = lookup(each.value, "ami")
  instance_type          = lookup(each.value, "instance_type")
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = var.deploy_subnet

  tags = {
      team = lookup(each.value, "team")
  }
}