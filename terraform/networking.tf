

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_mgmt"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }
}


resource "aws_security_group" "client_security_group" {
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
   ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "http"
  }
}
resource "aws_security_group" "postgres_security_group" {
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "http"
  }
}
resource "aws_security_group" "redis_security_group" {
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  ingress {
    from_port = 6379
    to_port   = 6379
    protocol  = "http"
  }
}
resource "aws_security_group" "server_security_group" {
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
   ingress {
    from_port = 5000
    to_port   = 5000
    protocol  = "http"
  }
}
