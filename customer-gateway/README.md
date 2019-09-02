# Customer Gateway

The customer gateway resource is required in order to create a VPN attachment to a transit gateway.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ip\_address | The IP address of the gateway's Internet-routable external interface | string | n/a | yes |
| name | The name of the Customer Gateway | string | n/a | yes |
| bgp\_asn | The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN) | string | `"65000"` | no |
| tags | Additional tags for the CGW | map | `<map>` | no |
| type | The type of customer gateway. The only type AWS supports at this time is `ipsec.1` | string | `"ipsec.1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The id of the customer gateway |

