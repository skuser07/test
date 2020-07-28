resource "aws_vpc" "user07_dev" { 
cidr_block = "7.0.0.0/16" 
enable_dns_hostnames = true
enable_dns_support =true
instance_tenancy ="default"
tags = {
Name = "user07_dev"
} 
}