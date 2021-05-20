# Transit Gateway Route Table Module

This module creates a Transit Gateway Route Table and will associate this with a provided Transit Gateway Attachment. It can optional add a propagation to any other Transit Gateway attachments as well as adding a list of static routes.

When adding static routes, the variable `transit_gateway_static_routes` takes a list of the values for the following keys `cidr_block` and `attachment_id`. An example is as follows

```
transit_gateway_static_routes = [
  {"cidr_block" = "1.2.3.4/32" "attachment_id" = "tgw-attach-0123456789abc" },
  {"cidr_block" = "172.31.0.0/16" "attachment_id" = "tgw-attach-0987654321def" }
]
```
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
| name | Name tag for the Transit Gateway | `any` | n/a | yes |
| transit_gateway_attachment_id | The Transit Gateway Attachment id to associate with the route table | `any` | n/a | yes |
| transit_gateway_id | The Transit Gateway id | `any` | n/a | yes |
| tags | Tags to add to all resources | `map` | `{}` | no |
| transit_gateway_propagate_attachment_ids | A list of Transit Gateway Attachment ids to propagate in the route table | `list(string)` | `[]` | no |
| transit_gateway_static_routes | A list of key value pairs containing the cidr block and the attachment id route combinations | `list(object({ cidr_block = string, attachment_id = string }))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| transit_gateway_route_table_id | Transit Gateway Route Table identifier |

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
