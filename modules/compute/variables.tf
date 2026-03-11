variable "region" {
  type    = string
  default = "europe-west2"
}

variable "zone" {
  type    = string
  default = "a"
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