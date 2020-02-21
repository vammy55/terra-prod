provider "aws" {
  region = var.regionas
  access_key = "AKIA6IN4GMZVT6T7LA65"
  secret_key = "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"
}
 
module "ec2" {
  source = "./Modules/Ec2"
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
      access_key = "AKIA6IN4GMZVT6T7LA65"
      secret_key = "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"
      bucket = "terrafrom-vv"
      key = "terraforma"
      region = "us-east-1"
      dynamodb_table = "terraform-up-and-running-locks"
    }
}











