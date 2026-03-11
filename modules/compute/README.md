<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.kubectl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.tcp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.udp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.web](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_network.compute_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_resource_policy.auto_start_and_stop](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy) | resource |
| [google_compute_subnetwork.compute_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_secret_manager_regional_secret.ssh_private_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_regional_secret) | resource |
| [google_secret_manager_regional_secret.ssh_public_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_regional_secret) | resource |
| [google_secret_manager_regional_secret_version.ssh_private_key_openssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_regional_secret_version) | resource |
| [google_secret_manager_regional_secret_version.ssh_public_key_openssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_regional_secret_version) | resource |
| [tls_private_key.private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [google_secret_manager_regional_secret_version.admin_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_regional_secret_version) | data source |
| [google_secret_manager_regional_secret_version.vault_password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_regional_secret_version) | data source |
| [http_http.api_query](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_component"></a> [component](#input\_component) | n/a | `string` | `"compute"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | `"eoc"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"europe-west2"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `"a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
<!-- END_TF_DOCS -->