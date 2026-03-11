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
  type    = string
  default = "gke"
}

variable "iam_roles_list" {
  description = "List of IAM roles to be assigned to GKE service account"
  type        = list(string)
  default = [
    "roles/container.nodeServiceAccount",
  ]
}

variable "wi_iam_roles_list" {
  description = "List of IAM roles to be assigned to Workload Identity service account"
  type        = list(string)
  default = [
    "roles/clouddebugger.agent",
    "roles/cloudprofiler.agent",
    "roles/cloudtrace.agent",
    "roles/monitoring.metricWriter",
  ]
}