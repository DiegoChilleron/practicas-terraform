variable "instancias" {
  description = "Nombre de las instancias"
  type        = set(string)
  default     = ["apache", "mysql", "jumpserver"]
}


resource "aws_instance" "public_instance" {
  for_each               = var.instancias
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/user_data.sh")

  tags = {
    "Name" = each.value
  }
}

resource "aws_instance" "monitoring_instance" {
  count                  = var.enable_monitoring ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/user_data.sh")

  tags = {
    "Name" = "Monitoreo"
  }
}









# variable "cadena" {
#   type    = string
#   default = "ami-123, AMI-AAV, ami-12f"
# }

# variable "palabras" {
#   type = list(string)
#   default = ["hola","como","estan"]
# }

# variable "entornos" {
#   type = map(string)
#   default = {
#     "prod" = "10.10.0.0/16"
#     "dev" = "172.16.0.0/16"
#   }
# }
