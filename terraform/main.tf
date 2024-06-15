#terraform {
#  backend “s3” {
#    bucket = “backend_state”
#    # Specify the path to the state file within the bucket
#    key = “terraform.tfstate”
#    region = “us-east-1”
#    dynamodb_table = “terraform_lock”
#    encrypt = true
#  }
#}





provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


module "vpc" {
source = "./vpc"
}


module "gateway" {
source = "./gateway"
vpc_id = module.vpc.vpc_id
}


module "routing_table" {
source = "./routing_table"
vpc_id = module.vpc.vpc_id
gateway_id = module.gateway.gateway_id
}


module "subnet" {
source = "./subnet"
vpc_id = module.vpc.vpc_id
}


module "table_association" {
source = "./table_association"
subnet_id = module.subnet.subnet_id
routing_table_id = module.routing_table.routingtable_id
}


#using ec2 module to set up the ec2 instance

module "ec2" {
source = "./ec2"
subnet_id = module.subnet.subnet_id
vpc_id = module.vpc.vpc_id
vpc_cidr_block = module.vpc.vpc_cidr_block
#securitygroup_id = [module.securitygroup.securitygroup_id]
}


module "cloudwatch"{
source= "./cloudwatch"
ec2_id = module.ec2.ec2_id

}
