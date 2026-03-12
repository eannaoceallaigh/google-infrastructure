<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_custom_role.compute_contributor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.compute_gsa_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.iam_member_compute](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.wi_gsa_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.compute](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account.compute_gsa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account.wi_gsa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_component"></a> [component](#input\_component) | n/a | `string` | `"gke"` | no |
| <a name="input_iam_roles_list"></a> [iam\_roles\_list](#input\_iam\_roles\_list) | List of IAM roles to be assigned to GKE service account | `list(string)` | <pre>[<br/>  "roles/container.nodeServiceAccount"<br/>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | `"eoc"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"europe-west2"` | no |
| <a name="input_wi_iam_roles_list"></a> [wi\_iam\_roles\_list](#input\_wi\_iam\_roles\_list) | List of IAM roles to be assigned to Workload Identity service account | `list(string)` | <pre>[<br/>  "roles/clouddebugger.agent",<br/>  "roles/cloudprofiler.agent",<br/>  "roles/cloudtrace.agent",<br/>  "roles/monitoring.metricWriter"<br/>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `"b"` | no |
<!-- END_TF_DOCS -->