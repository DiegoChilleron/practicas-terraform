resource "aws_instance" "public_instance" {
  ami           = "ami-0ae8f15ae66fe8cda"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = data.aws_key_pair.key.key_name

  // lifecycle {
  //  create_before_destroy = true
  //  prevent_destroy       = true
  //  ignore_changes = {}
  //  replace_triggered_by = []
  //    aws_subnet.private_subnet.id ]
  //  }

}
