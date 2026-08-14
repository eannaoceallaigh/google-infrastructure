variable "region" {
  type    = string
  default = "europe-west2"
}

variable "zone" {
  type    = string
  default = "b"
}

variable "project_id" {
  type = string
}

variable "project_name" {
  type    = string
  default = "eoc"
}

variable "component" {
  default = "compute"
}

variable "instance_name" {
  type = string
}

variable "cloudflare_api_token" {}

variable "domain" {
  type = string
}
