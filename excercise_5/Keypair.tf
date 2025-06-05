resource "aws_key_pair" "arsenal" {
  key_name   = "arsenal-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPhzrJqaxt79Evk8mPMbh0LvO34EX/gPi96ohdlOo2ZO Mathew@DESKTOP-1SJQ6P4"
}

# resource "aws_key_pair" "test" {
#   key_name   = "test-key"
#   public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIET4y/T8nV8NjG8QAoWw+Ez9L2s6EVH/6R6AvQZ7igs0 Mathew@DESKTOP-1SJQ6P4"
# }