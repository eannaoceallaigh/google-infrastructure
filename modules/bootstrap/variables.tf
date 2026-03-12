variable "project_id" {
  type = string
}

variable "project_name" {
  type    = string
  default = "eoc"
}

variable "github_repository" {
  type = string
}

variable "github_organisation" {
  type = string
}

variable "bucket" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "zone" {
  type    = string
  default = "europe-west2-b"
}

variable "email_address" {
  type = string
}