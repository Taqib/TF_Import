provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "imported_vpc" {
  # Arguments will be added after import
}
