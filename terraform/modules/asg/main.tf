resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_launch_template" "lt-10" {
  name_prefix   = "lt-net10"
  image_id      = "ami-02e9d6dbf90cfee6f"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo self.private_ip"
  }

    tags = {
      Name = "web"
    }

}

resource "aws_autoscaling_group" "my-asg" {
  availability_zones = ["eu-central-1a","eu-central-1b", "eu-central-1c"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.lt-10.id}"
    version = "$Latest"
  }
}

resource "aws_lb_target_group" "net10-lb-attachment" {
  name     = "net10-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_net10_id}"
}

resource "aws_lb_target_group_attachment" "net10-lb-attachment" {
  count               = "${length(var.target_ids) > 0 ? length(var.target_ids) : 0}"
  target_group_arn = "${aws_lb_target_group.net10-lb-attachment.arn}"
  target_id        = "${aws_autoscaling_group.my-asg.id}"
  port             = 80
}
