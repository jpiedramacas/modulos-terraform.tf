module "vpc" {
  source           = "./modules/vpc"
  aws_region       = "us-east-1"
  vpc_cidr_block   = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source           = "./modules/ec2"
  ami              = "ami-08a0d1e16fc3f61ea"
  instance_type    = "t2.micro"
  subnet_id        = module.vpc.public_subnet_ids[0] # Seleccionamos la primera subred pública
  key_name         = "vockey"
  security_group_id = module.vpc.ec2_security_group_id
}

module "rds" {
  source               = "./modules/rds"
  aws_region           = "us-east-1"
  db_instance_identifier = "My-RDS-Instance"
  db_allocated_storage  = 10
  db_name              = "mydb"
  db_engine            = "mysql"
  db_engine_version    = "8.0"
  db_instance_class    = "db.t3.micro"
  db_username          = "admin01"
  db_password          = "password01"
  db_subnet_group_name = "default"
  db_parameter_group_name = "default.mysql8.0"
  db_publicly_accessible = false
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}

output "ec2_security_group_id" {
  value = module.vpc.ec2_security_group_id
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}

output "ec2_instance_public_ip" {
  value = module.ec2.ec2_instance_public_ip
}
