resource "aws_instance" "server" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.foursg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "java-ins"
  }
}


resource "aws_security_group" "foursg" {
  vpc_id      =  var.vpc_id
  name = var.foursg_name
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.foursg_name
  }
}
