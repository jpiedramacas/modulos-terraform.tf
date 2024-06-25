resource "aws_db_instance" "default" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = var.db_subnet_group_name
  parameter_group_name = var.db_parameter_group_name
  publicly_accessible  = var.db_publicly_accessible

  tags = {
    Name = var.db_instance_identifier
  }
}
