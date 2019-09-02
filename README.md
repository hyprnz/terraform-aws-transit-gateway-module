# Transit Gateway Terraform Module

This module provisions a Transit Gateway and configures any resource sharing require for cross account support.

If `connecting_aws_account_numbers` is not specified, no RAM sharing options will be configured.

RAM Sharing needs to be supported in the root account before creating the `aws_ram_principal_association` resource

The only supported means of accepting a shared attachment from another account is by setting the `auto_accept_shared_attachments` to `enable`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the transit gateway | string | n/a | yes |
| auto\_accept\_shared\_attachments | Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. | string | `"disable"` | no |
| connecting\_aws\_account\_numbers | The AWS account numbers to share the transit gateway with. Should exclude the account number where the transit gateway is being provisioned | list | `<list>` | no |
| default\_route\_table\_association | Whether resource attachments are automatically associated with the default association route table. Valid values: `disable`, `enable`. | string | `"enable"` | no |
| default\_route\_table\_propagation | Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. | string | `"enable"` | no |
| description | A description of the Transit Gateway | string | `""` | no |
| ram\_resource\_share\_tags | Additional tags for the Resource Share | map | `<map>` | no |
| tags | A map of tags to add to all resources | map | `<map>` | no |
| tgw\_tags | Additional tags for the transit gateway | map | `<map>` | no |

