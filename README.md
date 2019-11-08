# Transit Gateway Associated Terraform Modules

This repo contains a collection of associated resources for provisioning Transit Gateway connections. The AWS Transit Gateway can provide simplified cross account and cross VPC & VPN routing. More information on Transit Gateways can be found on [AWS](https://aws.amazon.com/transit-gateway/)

This repo contains other related modules for creating resources that integrate with a TGW.

* [Customer Gateway](customer-gateway/README.md)
* [Transit Gateway](tgw/README.md)
* [Transit Gateway Route Table](tgw-route-table/README.md)
* [Transit Gateway VPC Attachment](tgw-vpc-attachment/README.md)
* [Transit Gateway VPN Attachment](tgw-vpn-attachment/README.md)

### Required configuration for cross VPC routing

Below is a list of resources and configurations that need to be completed in order to provide cross VPC (including VPC's in other AWS accounts) routing. Some of these resources are not included in this repo

1. A Transit Gateway
1. A Transit Gateway VPC Attachment - binds a VPC to a Transit Gateway
1. A Transit Gateway Route Table - Associated with an Attachment and can propagate routes from other attachments and hold static route entries
1. VPC routes in VPC Route Table associated with subnet - Broadcasts routes to the Transit Gateway
1. Security groups to allow VPC cidr source ranges

