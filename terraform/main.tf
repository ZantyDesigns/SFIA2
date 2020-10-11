provider "aws" {
    shared_credentials_file = "~/.aws/credentials"
    region = "eu-west-2"
}

resource "aws_instance" "jenkins" {
     tags = { Name = "jenkins" }
     ami = "ami-09a1e275e350acf38"
     instance_type = "t2.micro"
     subnet_id = "subnet-b99dc3d0"
     vpc_security_group_ids = ["sg-0b4002c4c66cab4b4",]
     key_name = "final-instance-1"
}

resource "aws_instance" "test" {
    tags = { Name = "test" }
    ami = "ami-09a1e275e350acf38"
    instance_type = "t2.micro"
    subnet_id = "subnet-b99dc3d0"
    vpc_security_group_ids = ["sg-0b4002c4c66cab4b4",]
    key_name = "test-instance"
}

### The Elastic IP for the Bastion
resource "aws_eip" "EIP" {
 vpc = true
 instance = aws_instance.jenkins.id
 associate_with_private_ip = aws_instance.jenkins.private_ip
 tags = {
  Name = "elastic-ip"
 }
}

resource "aws_db_instance" "deploy" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "deploy"
  db_subnet_group_name = "default-vpc-134e1a7b"
  vpc_security_group_ids = ["sg-0b4002c4c66cab4b4",]
  identifier           = "deploydb"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
}

resource "aws_db_instance" "testdb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "testdb"
  db_subnet_group_name = "default-vpc-134e1a7b"
  vpc_security_group_ids = ["sg-0b4002c4c66cab4b4",]
  identifier           = "testdb"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
}