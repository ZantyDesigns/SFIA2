output "ec2_id_jenkins" {
  value = aws_instance.jenkins.id
}

output "ec2_dns_jenkins" {
  value = aws_instance.jenkins.public_dns
}

output "ec2_id_test" {
  value = aws_instance.test.id
}

output "ec2_dns_test" {
  value = aws_instance.test.public_dns
}
