module "example_cgw" {
  source = "../../customer-gateway"

  providers = {
    aws = aws
  }

  name       = "example-cgw"
  ip_address = "1.2.3.4"
}
