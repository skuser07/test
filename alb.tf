resource "aws_alb" "user07_alb" {
    name = "user07-alb"
    internal = false
    security_groups = [aws_security_group.user07_allow_http.id]
    subnets = [
        aws_subnet.user07_public_1a.id,
        aws_subnet.user07_public_1c.id
    ]
    access_logs {
        bucket = "${aws_s3_bucket.user07_alb.id}"
        prefix = "user07_frontend-alb"
        enabled = true
    }
    tags = {
        Name = "user07-ALB"
    }
    lifecycle { create_before_destroy = true }
}

#alb target group
resource "aws_alb_target_group" "user07_frontend" {
    name = "frontend-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.user07_dev.id
    health_check {
        interval = 30
        path = "/"
        healthy_threshold = 3
        unhealthy_threshold = 3
    }
    tags = { Name = "user06-Frontend Target Group" }
}

resource "aws_alb_listener" "http" {
    load_balancer_arn = aws_alb.user07_alb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        target_group_arn = "${aws_alb_target_group.user07_frontend.arn}"
        type = "forward"
    }
}

