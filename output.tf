output "dns" {
  value = "${aws_lb.test.dns_name}"
}