variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_rules" {

  type = list(object({

    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string

    cidr_ipv4 = optional(string)
    cidr_ipv6 = optional(string)

    prefix_list_id = optional(string)

    referenced_security_group_id = optional(string)

  }))

  default = []

}

variable "egress_rules" {

  type = list(object({

    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string

    cidr_ipv4 = optional(string)
    cidr_ipv6 = optional(string)

    prefix_list_id = optional(string)

    referenced_security_group_id = optional(string)

  }))

  default = []

}


variable "tags" {

  type    = map(string)
  default = {}

}