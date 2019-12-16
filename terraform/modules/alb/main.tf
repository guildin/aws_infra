resource "aws_lb" "alb10" {
  name               = "alb10-lb-tf"
  internal           = false
  load_balancer_type = "application"
  subnets            = "${var.subnets_id}"

  enable_deletion_protection = false

}


