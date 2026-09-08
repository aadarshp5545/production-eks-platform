data "aws_lb" "alb" {
  name = "${local.name}-alb"
}

data "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.alb.arn
  port              = 80
}

resource "aws_lb_listener_rule" "portfolio_path" {
  listener_arn = data.aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = data.aws_lb_listener.http.default_action[0].target_group_arn
  }

  condition {
    path_pattern {
      values = ["/", "/health", "/api/*"]
    }
  }
}
