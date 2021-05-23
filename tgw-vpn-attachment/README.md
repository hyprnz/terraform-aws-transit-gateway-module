# Transit Gateway VPN Attachment

This module creates a VPN connection and associates it with the selected Transit Gateway. It creates it's own route table
and adds any static routes accessible over the VPN link.

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
| cidr_subnets_for_static_routes | A list of cidrs subnets to be routed over the vpn connection | `list(string)` | n/a | yes |
| customer_gateway_id | The customer gateway id for the VPN Connection | `any` | n/a | yes |
| name | Name of the tgw-attachment resource | `any` | n/a | yes |
| transit_gateway_id | The transit gateway id | `any` | n/a | yes |
| enable_static_routes_only | If the VPN connection should use static routing only | `bool` | `false` | no |
| tags | Additional tags for all vpn-attachment resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| tgw_vpn_attachment_id | The attachment id |
| tgw_vpn_attachment_route_table_association_id | The attachment to route table association id |
| tgw_vpn_attachment_route_table_id | The route table id |
| vpn_id | The VPN connection id |

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
