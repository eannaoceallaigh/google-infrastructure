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

variable "bucket" {
  type = string
}

variable "github_organisation" {
  type = string
}

variable "github_repository" {
  type = string
}

variable "email_address" {
  type = string
}