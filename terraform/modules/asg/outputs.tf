output "asg_net10_id" {
value = "asg.aws_autoscaling_group.my-asg.id"
}

output "target_ids" {
value = "asg.aws_launch_template.lt-10.id"
}
