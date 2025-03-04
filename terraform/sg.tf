data "http" "myip2" {
  url = "https://ipv4.icanhazip.com"
}

locals {
  inbound_ports  = toset(var.inbound_ports)
  outbound_ports = toset(var.outbound_ports)
}

resource "aws_security_group" "allow_all_new" {
  name        = "${var.vpc_name}-Allow-All_new"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip2.response_body)}/32"]
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip2.response_body)}/32"]
    }
  }
}

# Create Security Group for the EKS  
resource "aws_security_group" "eks_security_group" {
  name   = "Worker node security group"
  vpc_id = aws_vpc.default.id

  ingress {
    description = "All access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "outbound access"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-EKS-security-group"
    Env  = var.environment
    Type = var.type
  }
}

