output "ec2_id_jenkins" {
  value = aws_instance.jenkins.id
}

output "ec2_id_test" {
  value = aws_instance.test.id
}

output "ec2_id_deploy" {
  value = aws_instance.deploy.id
}