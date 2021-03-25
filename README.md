# monitoring-sg
This repo contains a terraform module for handle the security group for icinga2 monitoring tool, it enables you to maintain a security group that is attached to a current running icinga2 instance. in the future it could be added to a complete icinga2 terraform module.

for launch this icinga-sg module you need to define the following variables.

**icinga_clients_ips**: A list of clients ips that need to access to port 5665/TCP in the following format ["10.10.15.2/32","10.10.16.0/24"]

**icinga_web_access_ips**: A list of ips that need to access to port 80/TCP and 443/TCP in the following format ["10.10.15.2/32","10.10.16.0/24"]

**icinga_ssh_access_ips**: A list of ips that need to access to port 22/TCP in the following format ["10.10.15.2/32","10.10.16.0/24"]

**vpc_id**: This is the VPC ID where Icinga2 instance live

**primary_network_interface_id**: ID of the primary network interface of Icinga2 instance

**aws_region**: AWS Region where Icinga2 lives

**aws_credentials_file**: Path to local AWS credentials files (define it in terraform.tfvars)

**aws_profile**: AWS Profile for credentials (define it in terraform.tfvars) 

