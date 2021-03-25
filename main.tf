module "sg-icinga" {
    source = "./sg-icinga"
    security_groups = local.security_groups
    vpc_id = var.vpc_id
    primary_network_interface_id = var.primary_network_interface_id
}