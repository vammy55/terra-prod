resource "aws_launch_configuration" "as_conf" {
  name          = "web-servers"
  image_id      = "ami-09d069a04349dc3cb"
  instance_type = "t2.micro"
  security_groups = ["sg-062c53c2e5605d51a"]
}

resource "aws_autoscaling_group" "bar" {
  name                 = "web-serversGroup"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 1
  max_size             = 2
  vpc_zone_identifier  = data.aws_subnet_ids.myvpc.ids

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

data "aws_subnet_ids" "myvpc" {
  vpc_id = "vpc-06778e35977451bbb"
}