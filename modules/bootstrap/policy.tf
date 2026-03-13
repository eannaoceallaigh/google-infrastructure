resource "google_org_policy_policy" "preventPrivilegedBasicRolesForDefaultServiceAccounts" {
  name   = "projects/${var.project_id}/policies/iam.managed.preventPrivilegedBasicRolesForDefaultServiceAccounts"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}