# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# provider "aws" {
#   region = var.region
# }
#
# data "aws_ami" "ubuntu" {
#   most_recent = true
#
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
#
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#
#   owners = ["099720109477"] # Canonical
# }
#
# resource "aws_instance" "ubuntu" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#
#   tags = {
#     Name = var.instance_name
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev"
  }
}
