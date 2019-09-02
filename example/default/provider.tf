provider "aws" {
  alias  = "noassume"
  region = "${var.aws_region}"
}

provider "aws" {
  region = "${var.aws_region}"
}