output "subnet_id" {
  value = [
       aws_subnet.net10_1a.id,
       aws_subnet.net10_1b.id,
       aws_subnet.net10_1c.id
]
}
output "vpc_net10_id" {
value = aws_vpc.vpc_net10.id
}
