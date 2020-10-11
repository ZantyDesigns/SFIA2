provider "aws" {
    shared_credentials_file = "~/.aws/credentials"
    region = "eu-west-2"
    profile = "terraform"
}

resource "aws_instance" "jenkins" {
     ami = "ami-09a1e275e350acf38"
     instance_type = "t2.micro"
     subnet_id = "subnet-b99dc3d0"
     vpc_security_group_ids = ["sg-0b4002c4c66cab4b4",]
     key_name = "final-instance-1"
}

resource "aws_instance" "test" {
    ami = "ami-09a1e275e350acf38"
    instance_type = "t2.micro"
    subnet_id = "subnet-b99dc3d0"
    vpc_security_group_ids = ["sg-0b4002c4c66cab4b4",]
    key_name = "test-instance"
}

resource "aws_instance" "deploy" {
    ami = "ami-09a1e275e350acf38"
    instance_type = "t2.micro"
    subnet_id = "subnet-b99dc3d0"
    vpc_security_group_ids = ["sg-0b4002c4c66cab4b4",]
    key_name = "final-instance-2"
}
