output "instance1_public_ip" {
  value       = aws_instance.instance1.public_ip
  description = "Public IP address of the created EC2 instance"
}

output "instance2_public_ip" {
  value       = aws_instance.instance2.public_ip
  description = "Public IP address of the created EC2 instance"
}

output "instance3_public_ip" {
  value       = aws_instance.instance3.public_ip
  description = "Public IP address of the created EC2 instance"
}