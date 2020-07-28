resource "aws_autoscaling_group" "user07_web" {
  name = "${aws_launch_configuration.user07_web.name}-asg"

  min_size             = 1
  desired_capacity     = 2
  max_size             = 3

  health_check_type    = "ELB"
  #load_balancers= ["${aws_alb.alb.id}" ] #classic
  target_group_arns   = ["${aws_alb_target_group.user07_frontend.arn}"]
  #alb = "${aws_alb.alb.id}"
  
  launch_configuration = "${aws_launch_configuration.user07_web.name}"
  ####  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]  아ㅐㄹ vpc_zone_identifier 와 중복

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity="1Minute"

  vpc_zone_identifier  = [
    "${aws_subnet.user07_public_1a.id}",
    "${aws_subnet.user07_public_1c.id}"
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "user07-web-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "user07-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.user07_web.id
  alb_target_group_arn   = aws_alb_target_group.user07_frontend.arn
}