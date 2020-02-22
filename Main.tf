provider "aws" {
  region = var.regionas
  # assume_role {
  #   role_arn = "arn:aws:iam::980184098411:instance-profile/ec2-admin"
  #   session_name = "test"
  # }
}

module "ec2" {
  source         = "./Modules/Ec2"
  instanceyotype = "t2.micro"
}

# module "autoscaling" {
#   source = "./Modules/Autoscaling"
# }
# resource "aws_dynamodb_table" "terraform_locks" {  
# name         = "terraform-up-and-running-locks"  
# billing_mode = "PAY_PER_REQUEST"  
# hash_key     = "LockID"  
#   attribute {    
#     name = "LockID"    
#     type = "S"  
#     }
# }

# resource "aws_s3_bucket" "b" {
#   bucket = "terrafrom-vammy"
#   acl    = "private"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

terraform {
  backend "s3" {
    bucket         = "terrafrom-vv"
    key            = "terraforma"
    region         = "us-east-1"
    dynamodb_table = "terraform-up-and-running-locks"
  }
}

