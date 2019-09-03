# Transit Gateway VPN Attachment

This module creates a VPN connection and associates it with the selected Transit Gateway. It creates it's own route table
and adds any static routes accessible over the VPN link.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cdir\_subnets\_for\_static\_routes | A list of cdirs subnets to be routed over the vpn connection | list | n/a | yes |
| customer\_gateway\_id | The customer gateway id for the VPN Connection | string | n/a | yes |
| name | Name of the tgw-attachment resource | string | n/a | yes |
| transit\_gateway\_id | The transit gateway id | string | n/a | yes |
| enable\_static\_routes\_only | If the VPN connection should use static routing only | string | `"false"` | no |
| tags | Additional tags for all vpn-attachment resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| tgw_vpn\_attachment\_route\_table\_id | The route table id |
| tgw\_vpn\_attachment\_id | The attachment id |
| tgw\_vpn\_attachment\_route\_table\_association\_id | The attachment to route table association id |
| vpn\_id | The VPN connection id |

