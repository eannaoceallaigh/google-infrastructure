# google-infrastructure

Create resources in Google Cloud Platform using Terraform.

There are two subfolders that are used to deploy the resources:

- components
- modules

The folders are split into subfolders based on function:

| Component | Used for |
|-|-|
| bootstrap | Creating budgets with alerts to manage costs |
| compute | Creating virtual machines and associated resources |
| dns | Registering dns in Cloudflare |
| iam | Setting up service accounts and workload identity |

It is best practice to use modules to group related resources together. This enables the creation of multiple copies of resources, if necessary, with minimum repetition in line with the [DRY principle](https://en.wikipedia.org/wiki/Don't_repeat_yourself).