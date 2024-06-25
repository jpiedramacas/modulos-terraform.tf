output "ec2_instance_id" {
  value = aws_instance.MY-EC2.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.MY-EC2.public_ip
}
