
resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc2.id
   health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
resource "aws_lb_target_group" "test1" {
  name     = "tf-example-lb-tg3"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc2.id
   health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.test.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:699475925558:certificate/ab24b4cd-7570-4262-86b9-7b0a61b158f4"

  default_action {
    type = "forward"
   forward {
      target_group {
        arn = aws_lb_target_group.test.arn
      }
    }
  }
}
resource "aws_lb_listener" "https1" {
  load_balancer_arn = aws_lb.test.arn
  port              = 80
  protocol          = "HTTP"
  

  default_action {
    type = "forward"
   forward {
      target_group {
        arn = aws_lb_target_group.test1.arn
      }
    }
  }
}