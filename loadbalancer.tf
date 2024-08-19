resource "aws_lb" "test" {
  name               = "test-lb-tf1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security2.id]
  subnets            = [aws_subnet.subnet1a.id,aws_subnet.subnet2b.id]

  enable_deletion_protection = true
  tags = {
    Environment = "production"
  }
}