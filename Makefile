attach_asg:
export PATH="/usr/local/aws-cli/v2/current/bin:$PATH"
aws autoscaling attach-load-balancer-target-groups --auto-scaling-group-name "tf-asg-20191216135049814400000003"  --target-group-arns "arn:aws:elasticloadbalancing:eu-central-1:289341358241:targetgroup/net10-lb-tg/ce61153d063d4207"
