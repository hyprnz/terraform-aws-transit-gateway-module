# Transit Gateway Route Table Module

This module creates a Transit Gateway Route Table and will associate this with a provided Transit Gateway Attachment. It can optional add a propagation to any other Transit Gateway attachments as well as adding a list of static routes.

When adding static routes, the variable `transit_gateway_static_routes` takes a list of the values for the following keys `cidr_block` and `attachment_id`. An example is as follows

```
transit_gateway_static_routes = [
  {"cidr_block" = "1.2.3.4/32" "attachment_id" = "tgw-attach-0123456789abc" },
  {"cidr_block" = "172.31.0.0/16" "attachment_id" = "tgw-attach-0987654321def" }
]
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name tag for the Transit Gateway | string | n/a | yes |
| transit\_gateway\_attachment\_id | The Transit Gateway Attachment id to associate with the route table | string | n/a | yes |
| transit\_gateway\_id | The Transit Gateway id | string | n/a | yes |
| tags | Tags to add to all resources | map | `<map>` | no |
| transit\_gateway\_propagate\_attachment\_ids | A list of Transit Gateway Attachment ids to propagate in the route table | list | `<list>` | no |
| transit\_gateway\_static\_routes | A list of key value pairs containing the cidr blcook and the attachment id route combinations | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| transit\_gateway\_route\_table\_id | Transit Gateway Route Table identifier |

