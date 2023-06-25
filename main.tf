#main resources, instances and buckets
#next validar acesso ssh as maquinas

resource "aws_s3_bucket" "bucket1" {
  bucket = "my-tf-bucket-victor"
  #acl = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

#regiao 1
resource "aws_instance" "app_server" {
  count = 1
  provider      = aws.us-east-1
  ami           = "${var.cfg_region1["ami"]}"
  instance_type = "${var.machine_type["dev_machine_type"]}"
  key_name      = local.key_name
  user_data = file("./bash/ec2_docker.sh")

  tags = {
    Name = "${var.project_name}-app_server-${count.index}"
    Desc = "depends on s3 bucket"
  }

  #depends_on = [aws_s3_bucket.ex_dev]
  vpc_security_group_ids = ["sg-0901e4c1d66305b8e","${aws_security_group.acesso-ssh-us-east-1.id}" ] #referencia
}



/*
#regiao 2
resource "aws_instance" "web_server" {
  count = 1
  provider      = aws.us-east-2
  ami           = "${var.cfg_region2["ami"]}"
  instance_type = "${var.machine_type["dev_machine_type"]}"
  key_name =      local.key_name
  #user_data = file("./sh_script.sh")

  tags = {
    Name = "independent"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}" ] #referencia
}

resource "aws_instance" "db_server" {
  count = 1
  provider = aws.us-east-1
  ami           = "${var.cfg_region1["ami"]}"
  instance_type = "${var.machine_type["dev_machine_type"]}"
  key_name      = local.key_name
  user_data     = file("./sh_script.sh")

  tags = {
    Name = "dev-${var.project_name}-db_server-${count.index}"
    Desc = "depends on dynamodb"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-1.id}" ] #referencia
  depends_on = [aws_dynamodb_table.dynamodb-table-homologacao ] #nomes dos recursos são unicos no terraform
}


#banco de dados dynamodb para vincular com uma instancia
resource "aws_dynamodb_table" "dynamodb-table-homologacao" {
  provider = aws.us-east-1
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

*/