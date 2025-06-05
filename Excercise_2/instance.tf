resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id
  key_name               = aws_key_pair.arsenal.key_name # OR "arsenal-key"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.arsenal-sg.id]
  availability_zone      = "us-east-1a" # Replace with your desired availability zone

  tags = {
    Name    = "arsenal-web"
    Project = "arsenal"
  }
}
resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}