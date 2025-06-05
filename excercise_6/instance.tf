resource "aws_instance" "web" {
  ami                    = var.amiID[var.region]
  key_name               = "arsenal-key"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.arsenal-sg.id]
  availability_zone      = var.zone1 # Replace with your desired availability zone

  tags = {
    Name    = "arsenal-web"
    Project = "arsenal"
  }
  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("arsenal") # use private key of arsenal key pair
    host        = self.public_ip  # Use self.public_ip for the public IP of the instance 
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh", # make the script executable
      "sudo /tmp/web.sh",     # execute the script 
    ]
  }
  provisioner "local-exec" {
    command = "echo Instance ${self.private_ip} >> private_ip.txt"
  }
}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}
output "webPublicIP" {
  description = "ami ID of ubuntu instance"
  value       = aws_instance.web.public_ip
}
output "webPrivateIP" {
  description = "ami ID of ubuntu instance"
  value       = aws_instance.web.private_ip
}