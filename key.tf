  
resource "aws_key_pair" "sshkey" {
  key_name   = "user07_sshkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCf/TmN50SWC6KyFnS2tbeoCBMKjZzQ8QYmBQwczFATJ9TPlq70M6wG29cEgGYu0MuyrJr33AVOtUcKHLMjHx+8NtB1ysAntyULcjLD778D4V0mwc9WTMCykOW5FqlbEtAfs4MLUgjD4gUQrF3KjAopSI5OsLyPm+KqWooSarUKEmMDt4XmMZOR7lwYp6tSxNDxm2SeyHh9kXOBZWzdqHDLtifqfaBqca21RwJqCXmE1DJGI9qevJOHVjvxHHBqoq9XOis9L4U156Y8kZFdv/Sz4v1DYoH9or3pIg2k8G0bwpAGLxeDJ2bUu8CnYg9etKuMW/iDbojLnB1zVqGTaBwH ec2-user@ip-172-31-12-169"
  }