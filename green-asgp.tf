data "template_file" "green_template" {
  template = file("${path.module}/user-data.sh.tpl")
  vars = {
    version = "green Version"
    color   = "lightgreen"
  }
}

resource "aws_launch_template" "green-template" {
  name_prefix            = "green-template"
  image_id               = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  user_data              = base64encode(data.template_file.green_template.rendered)
}

resource "aws_autoscaling_group" "green" {
  name                = "green_group"
  desired_capacity    = 1
  max_size            = 3
  min_size            = 0
  health_check_type   = "ELB"
  force_delete        = true
  vpc_zone_identifier = [data.aws_subnet.private-a.id]

  launch_template {
    id      = aws_launch_template.green-template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Green-Server"
    propagate_at_launch = true
  }

  timeouts {
    delete = "5m"
  }
}