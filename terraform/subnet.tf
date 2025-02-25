resource "aws_subnet" "public-subnets" {
  #count             = 3 # 0 1 2
  count             = length(local.public_subnet_cidrs)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(local.public_subnet_cidrs, count.index)
  availability_zone = element(local.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-${count.index + 1}-public-subnet"
  }
}

resource "aws_subnet" "private-subnets" {
  #count             = 3 # 0 1 2
  count             = length(local.private_subnet_cidrs)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(local.private_subnet_cidrs, count.index)
  availability_zone = element(local.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-${count.index + 1}-private-subnet"
  }
}