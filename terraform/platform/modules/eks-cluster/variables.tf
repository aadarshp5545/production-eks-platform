variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "endpoint_private_access" {
  type    = bool
  default = true
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "enabled_cluster_log_types" {

  type = list(string)

  default = [

    "api",
    "audit",
    "authenticator"

  ]

}

variable "tags" {

  type    = map(string)
  default = {}

}