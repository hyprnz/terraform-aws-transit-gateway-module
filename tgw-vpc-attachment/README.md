# Transit Gateway VPC Attachment

This module creates a Transit Gateway VPC attachment. Currently Transit Gateway Attachments only support 1 subnet per AZ.

A Transit Gateway attachment is then associated with a Transit Gateway Route Table, in which routes can be propagated or added to other Transit Gateway Attachments. A route must exist for the cidr in the VPC route table for the corresponding subnets routing traffic to the Transit Gateway Id. Routes can only be added when both the Gateway and the Attachment have been provisioned.

As a Transit Gateway can be shared cross account and associated cross account implementation details this module will not create/associate any Transit Gateway Route Tables.

## Module Details

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| transit\_gateway\_id | The id of the Transit Gateway the Attachment should bind to | string | n/a | yes |
| vpc\_id | The VPC id for the Attachment | string | n/a | yes |
| vpc\_subnet\_ids | A list of subnets for routing via the Transit Gateway Attachment. Can only be 1 subnet per AZ | list | n/a | yes |
| create\_default\_route\_table\_association | Whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. Default value: `true`. | string | `"true"` | no |
| create\_default\_route\_table\_propagation | Whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. Default value: true. | string | `"true"` | no |
| dns\_support | Whether DNS support is enabled. Valid values: `disable`, `enable`. Default value: `enable`. | string | `"enable"` | no |
| ipv6\_support | Whether IPv6 support is enabled. Valid values: `disable`, `enable`. Default value: `disable`. | string | `"disable"` | no |
| tags | a map of tags to add to Attachment Resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| transit\_gateway\_attachment\_id | The id of the ransit Gateway VPC Attachment |

