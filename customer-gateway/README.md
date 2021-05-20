# Terraform AWS Customer Gateway Resource Module

The customer gateway resource is provided as a dependency for the [Transit Gateway VPN Attachment](../tgw-vpn-attachment).

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
| ip_address | The IP address of the gateway's Internet-routable external interface | `any` | n/a | yes |
| name | The name of the Customer Gateway | `any` | n/a | yes |
| bgp_asn | The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN) | `number` | `65000` | no |
| tags | Additional tags for the CGW | `map` | `{}` | no |
| type | The type of customer gateway. The only type AWS supports at this time is `ipsec.1` | `string` | `"ipsec.1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The id of the customer gateway |

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