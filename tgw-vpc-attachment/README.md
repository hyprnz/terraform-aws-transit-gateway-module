# Transit Gateway VPC Attachment

This module creates a Transit Gateway VPC attachment. Currently Transit Gateway Attachments only support 1 subnet per AZ.

A Transit Gateway attachment is then associated with a Transit Gateway Route Table, in which routes can be propagated or added to other Transit Gateway Attachments. A route must exist for the cidr in the VPC route table for the corresponding subnets routing traffic to the Transit Gateway Id. Routes can only be added when both the Gateway and the Attachment have been provisioned.

As a Transit Gateway can be shared cross account and associated cross account implementation details this module will not create/associate any Transit Gateway Route Tables.

The current design pattern only specifies minimum Terraform and Provider version constraints. This could result in incompatibilities for newer releases of Terraform. See the [requirements](#requirements) section for more version details.

---
## Example

An default example of the module is located [here](example/main.tf)

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
| name | Name of Transit Gateway Attachment resource | `any` | n/a | yes |
| transit_gateway_id | The id of the Transit Gateway the Attachment should bind to | `any` | n/a | yes |
| vpc_id | The VPC id for the Attachment | `any` | n/a | yes |
| vpc_subnet_ids | A list of subnets for routing via the Transit Gateway Attachment. Can only be 1 subnet per AZ | `list(string)` | n/a | yes |
| create_default_route_table_association | Whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. Default value: `true`. | `bool` | `true` | no |
| create_default_route_table_propagation | Whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. Default value: true. | `bool` | `true` | no |
| dns_support | Whether DNS support is enabled. Valid values: `disable`, `enable`. Default value: `enable`. | `string` | `"enable"` | no |
| ipv6_support | Whether IPv6 support is enabled. Valid values: `disable`, `enable`. Default value: `disable`. | `string` | `"disable"` | no |
| tags | a map of tags to add to Attachment Resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| transit_gateway_attachment_id | The id of the ransit Gateway VPC Attachment |

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
