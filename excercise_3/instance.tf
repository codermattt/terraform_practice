resource "aws_instance" "web" {
  ami                    = var.amiID[var.region]
  key_name               = aws_key_pair.arsenal.key_name # OR "arsenal-key"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.arsenal-sg.id]
  availability_zone      = var.zone1 # Replace with your desired availability zone

  tags = {
    Name    = "arsenal-web"
    Project = "arsenal"
  }
}
resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}