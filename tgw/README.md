# Transit Gateway Terraform Module

This module provisions a Transit Gateway and configures any resource sharing require for cross account support.

If `connecting_aws_account_numbers` is not specified, no RAM sharing options will be configured.

RAM Sharing needs to be supported in the root account before creating the `aws_ram_principal_association` resource. See the [docs](https://docs.aws.amazon.com/ram/latest/userguide/getting-started-sharing.html#getting-started-sharing-orgs) on how to configure this in the root AWS organisation account. Currently this cannot be set via Terraform.

The only supported means of accepting a shared attachment from another account is by setting the `auto_accept_shared_attachments` to `enable`, otherwise an additional process outside of Terraform would be required.

The current design pattern only specifies minimum Terraform and Provider version constraints. This could result in incompatibilities for newer releases of Terraform. See the [requirements](#requirements) section for more version details.

---
## Examples

Two examples of the module are located
* [A default example](example/default/main.tf)
* [RAM sharing example](example/ram-share/main.tf)

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |
| aws | >= 3.38.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.38.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the transit gateway | `any` | n/a | yes |
| auto_accept_shared_attachments | Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. | `string` | `"disable"` | no |
| connecting_aws_account_numbers | The AWS account numbers to share the transit gateway with. Should exclude the account number where the transit gateway is being provisioned | `list(string)` | `[]` | no |
| default_route_table_association | Whether resource attachments are automatically associated with the default association route table. Valid values: `disable`, `enable`. | `string` | `"enable"` | no |
| default_route_table_propagation | Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. | `string` | `"enable"` | no |
| description | A description of the Transit Gateway | `string` | `""` | no |
| ram_resource_share_tags | Additional tags for the Resource Share | `map` | `{}` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| tgw_tags | Additional tags for the transit gateway | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the transit Gateway |
| default_route_table_id | The default route table associated with the Transit Gateway |
| id | The ID of the Transit Gateway |
| ram_resource_share_id | The id of the RAM resource share |

<br/>

---
## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```
Copyright 2020 Hypr NZ

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Copyright &copy; 2020 [Hypr NZ](https://www.hypr.nz/)
<!-- END_TF_DOCS -->