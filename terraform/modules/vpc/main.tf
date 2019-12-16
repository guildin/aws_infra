resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc_net10.id}"

  tags = {
    Name = "main"
  }
}

resource "aws_vpc" "vpc_net10" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_net10"
  }
}

resource "aws_subnet" "net10_1a" {
  vpc_id            = "${aws_vpc.vpc_net10.id}"
  availability_zone = "eu-central-1a"
  cidr_block = "10.0.0.0/20"

  tags = {
    Name = "vpc_net10_1a"
  }
}

resource "aws_subnet" "net10_1b" {
  vpc_id            = "${aws_vpc.vpc_net10.id}"
  availability_zone = "eu-central-1b"
  cidr_block = "10.0.16.0/20"

  tags = {
    Name = "vpc_net10_1b"
  }
}

resource "aws_subnet" "net10_1c" {
  vpc_id            = "${aws_vpc.vpc_net10.id}"
  availability_zone = "eu-central-1c"
  cidr_block = "10.0.32.0/20"

  tags = {
    Name = "vpc_net10_1c"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = "${aws_vpc.vpc_net10.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

    tags = {
      Name = "web"
    }

}

