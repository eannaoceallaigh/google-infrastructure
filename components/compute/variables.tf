variable "region" {
  type    = string
  default = "europe-west1"
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

variable "cloudflare_api_token" {}

variable "domain" {
  type = string
}