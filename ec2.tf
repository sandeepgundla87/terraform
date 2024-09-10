resource  "aws_security_group" "allow_ssh" {
    name = "allow ssh"
    description ="allow port 22"
    
    tags = {
    Name = "allow ssh"
    }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "ec2-1" {
    ami ="ami-09c813fb71547fc4f"
    instance_type ="t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
       Name = "ec2-1"
    }
}


