resource "aws_vpc" "main" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags =merge(
        var.tags,
        local.common_tags,
        {
        Name = local.common_name
        }
  )
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

    tags = merge(
    var.igw_tags,
        local.common_tags,
        {
        Name = local.common_name
        }
    )
}
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
        local.common_tags,
        {
        Name = "${local.common_name}-public-${local.az_names[count.index]}" #roboshop-dev-public-us-east-1a/1b
        }
    )
}
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
        local.common_tags,
        {
        Name = "${local.common_name}-private-${local.az_names[count.index]}" #roboshop-dev-private-us-east-1a/1b
        }
    )
}
resource "aws_subnet" "databases_subnets" {
  count = length(var.databases_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.databases_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
        local.common_tags,
        {
        Name = "${local.common_name}-databases-${local.az_names[count.index]}" #roboshop-dev-databases-us-east-1a/1b
        }
    )
}
# Route Tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  tags =merge(
        local.common_tags,
        {
        Name = "${local.common_name}-public" #roboshop-dev-public
        }
    )
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags =merge(
        local.common_tags,
        {
        Name = "${local.common_name}-private" #roboshop-dev-private
        }
    )
}
resource "aws_route_table" "databases_route_table" {
  vpc_id = aws_vpc.main.id

  tags =merge(
        local.common_tags,
        {
        Name = "${local.common_name}-databases" #roboshop-dev-databases
        }
    )
}
#Routes
resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

#elastic ip
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = merge(
        local.common_tags,
        {
        Name = "${local.common_name}-nat-eip" #roboshop-dev-nat-eip
        }
    )
}
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = merge(
        local.common_tags,
        {
        Name = "${local.common_name}-nat-gw" #roboshop-dev-nat-gw
        }
    )
  depends_on = [aws_internet_gateway.gw]  
}
#private route
resource "aws_route" "private_route" {
  route_table_id            = aws_route_table.private_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gw.id
}
#databases route
resource "aws_route" "databases_route" {
  route_table_id            = aws_route_table.databases_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gw.id
}

#route table associations
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "databases_subnet_association" {
  count          = length(var.databases_subnet_cidr)
  subnet_id      = aws_subnet.databases_subnets[count.index].id
  route_table_id = aws_route_table.databases_route_table.id
}



