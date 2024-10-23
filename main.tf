provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "imported_vpc" {
  # Arguments will be added after import
     cidr_block                           = "10.0.0.0/16"
     enable_dns_support                   = true
     tags                                 = {
         Name = "my-vpc"
     }

}
