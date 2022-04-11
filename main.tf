# DATA SOURCE FOR AMI
data "aws_ami" "aws_basic_linux" {
  owners      = [var.aws_owner_id]
  most_recent = true
  filter {
    name   = "name"
    values = [var.aws_ami_name]
    # we are using the * to be able to always get the most recent image form AMI 
  }
}


# DATA SOURCE FOR VPC
data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}


# DATA SOURCE FOR PUBLIC SUBNET
data "aws_subnet" "public-a" {
  filter {
    name   = "tag:Name"
    values = [var.public-a_subnet_name]
  }
}

# DATA SOURCE FOR PUBLIC SUBNET
data "aws_subnet" "public-b" {
  filter {
    name   = "tag:Name"
    values = [var.public-b_subnet_name]
  }
}


# DATA SOURCE FOR PRIVATE SUBNET
data "aws_subnet" "private-a" {
  filter {
    name   = "tag:Name"
    values = [var.private-a_subnet_name]
  }
}

# DATA SOURCE FOR PRIVATE SUBNET
data "aws_subnet" "private-b" {
  filter {
    name   = "tag:Name"
    values = [var.private-b_subnet_name]
  }
}