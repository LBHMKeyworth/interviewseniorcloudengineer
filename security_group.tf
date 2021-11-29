resource "aws_security_group" "security_group" {
  name        = "Council tax refunder access"
  description = "Allow access to Council tax refunder application"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description      = "443 from subnet"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [data.aws_subnet.subnet.cidr_block]
  }

  ingress {
    description      = "RDP from subnet"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = [data.aws_subnet.subnet.cidr_block]
  }

  ingress {
    description      = "443 from SG"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups = [ "sg-047e8b584ee9ea9b8" ]
  }

  ingress {
    description      = "RDP from SG"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    security_groups = [ "sg-047e8b584ee9ea9b8" ]
  }

  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }
}