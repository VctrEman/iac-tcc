#1 SG per AWS Region
#security group @ https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

#security group us east 1
resource "aws_security_group" "acesso-ssh-us-east-1" {
  provider = aws.us-east-1    #provider com alias 
  name        = "acesso-ssh"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id
 
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.91.143.71/32",]
  } 
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["177.91.143.71/32",]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["177.91.143.71/32",]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "metabase"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["177.91.143.71/32",]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_ssh"
  }
}

/*
resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2 #provider com alias 
  name        = "acesso-ssh"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.91.143.71/32",]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
*/