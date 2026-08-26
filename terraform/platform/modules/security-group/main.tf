resource "aws_security_group" "this" {

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = var.tags

}

resource "aws_vpc_security_group_ingress_rule" "this" {

  for_each = {

    for index, rule in var.ingress_rules :

    index => rule

  }

  security_group_id = aws_security_group.this.id

  description = try(each.value.description, null)

  from_port = each.value.protocol == "-1" ? null : try(each.value.from_port, null)

  to_port = each.value.protocol == "-1" ? null : try(each.value.to_port, null)

  ip_protocol = each.value.protocol

  cidr_ipv4 = try(each.value.cidr_ipv4, null)

  cidr_ipv6 = try(each.value.cidr_ipv6, null)

  prefix_list_id = try(each.value.prefix_list_id, null)

  referenced_security_group_id = try(each.value.referenced_security_group_id, null)

}

resource "aws_vpc_security_group_egress_rule" "this" {

  for_each = {

    for index, rule in var.egress_rules :

    index => rule

  }

  security_group_id = aws_security_group.this.id

  description = try(each.value.description, null)

  from_port = each.value.from_port

  to_port = each.value.to_port

  ip_protocol = each.value.protocol

  cidr_ipv4 = try(each.value.cidr_ipv4, null)

  cidr_ipv6 = try(each.value.cidr_ipv6, null)

  prefix_list_id = try(each.value.prefix_list_id, null)

  referenced_security_group_id = try(each.value.referenced_security_group_id, null)

}