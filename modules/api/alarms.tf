resource "aws_cloudwatch_log_metric_filter" "api_gw_502" {
  name = "${var.app_name}-apigw-timeout-error"
  pattern = "Execution failed due to a timeout error"
  log_group_name = aws_cloudwatch_log_group.apigw_stage.name

  metric_transformation {
    name = "timeout"
    namespace = "${var.app_name}-metrics"
    value = 1
  }
}
resource "aws_sns_topic" "wepapp_errors" {
  provider = aws
  name = "${var.app_name}-errros"
}
resource "aws_cloudwatch_metric_alarm" "webapp_timeout" {
  provider = aws
  alarm_name                = "${var.app_name}-apigw-timeout"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "timeout"
  namespace                 = "webapp-metrics"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "This metric monitors api gw timeout"
  insufficient_data_actions = []
  alarm_actions             = [aws_sns_topic.wepapp_errors.arn]
}
