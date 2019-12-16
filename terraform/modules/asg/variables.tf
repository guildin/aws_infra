variable "vpc_net10_id" {
  description = "aws vpc block id"
}
variable "alb_net10" {
  description = "aws vpc block id"
}
variable "target_ids" {
  description = "target id's for ASG instances"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
  default     = "~/.ssh/appuser.pub"
}
variable private_key_path {
  description = "IKE credential placement"
  default     = "~/.ssh/appuser"
}
