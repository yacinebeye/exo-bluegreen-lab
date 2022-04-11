resource "aws_lb" "applicat-lb" {
  name               = "applicat-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.loadbalancer_sg.id]
  subnets            = [data.aws_subnet.public-a.id, data.aws_subnet.public-b.id]

  tags = {
    Environment = "applicat-lb"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.applicat-lb.arn
  port              = "80"
  protocol          = "HTTP"

  
  default_action {
    type             = "forward"
    forward {
        target_group {
            arn = aws_lb_target_group.blue-target.arn
  }

  target_group {
            arn = aws_lb_target_group.green-target.arn
        }
    }
  }
}