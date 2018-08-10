terraform {
  backend "s3" {
    bucket = "brawndo.tfstate"
    key    = "security_groups.tfstate"
    region = "us-west-2"
  }
}

variable "region" {
  default = "us-west-2"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_security_group" "test_sg" {
  name        = "test_sg"
  description = "Test SG"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["192.168.0.0/24"]
  }
}
