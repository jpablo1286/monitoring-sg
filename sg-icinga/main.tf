resource "aws_security_group" "icinga_sg" {
  for_each    = var.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      cidr_blocks      = ingress.value.cidr_blocks
      description      = ""
      from_port        = ingress.value.from
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = ingress.value.protocol
      security_groups  = []
      self             = false
      to_port          = ingress.value.to
    }
  }
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Outgoing"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
}
### attaching sg to specific interface, this can be handled in a better way once the icinga instance bacame managed by terraform
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  for_each    = var.security_groups
  security_group_id    = aws_security_group.icinga_sg[each.key].id
  network_interface_id = var.primary_network_interface_id
}