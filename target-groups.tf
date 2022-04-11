resource "aws_lb_target_group" "blue-target" {
  name     = "blue-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main_vpc.id
}

resource "aws_lb_target_group" "green-target" {
  name     = "green-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main_vpc.id
}

resource "aws_autoscaling_attachment" "asg_attachment_blue" {
    autoscaling_group_name = aws_autoscaling_group.blue.id
    lb_target_group_arn = aws_lb_target_group.blue-target.arn 
}

resource "aws_autoscaling_attachment" "asg_attachment_green" {
    autoscaling_group_name = aws_autoscaling_group.green.id
    lb_target_group_arn = aws_lb_target_group.green-target.arn 
}
