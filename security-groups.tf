resource "aws_security_group" "app_sg" {
  name        = "my_app_sg"
  description = "allow access to the server"
  vpc_id      = data.aws_vpc.main_vpc.id

  #INBOUND CONNECTIONS 
  ingress {
    description = "allow ssh into the EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups    = [aws_security_group.loadbalancer_sg.id]

    }

  #OUTBOUND CONNECTIONS
  egress {
    description = "allow acces to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "loadbalancer_sg" {
  name        = "lb_sg"
  description = "allow access to the LoadBalancer"
  vpc_id      = data.aws_vpc.main_vpc.id

  #INBOUND CONNECTIONS 
  ingress {
    description = "allow ssh into the EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #access t the world 
  }

  #OUTBOUND CONNECTIONS
  egress {
    description = "allow acces to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}