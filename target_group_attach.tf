resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test1.arn
  target_id        = aws_instance.ins3.id
  port             = 8080
}
resource "aws_lb_target_group_attachment" "test1" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.ins3.id
  port             = 80
}
