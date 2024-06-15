resource "aws_sns_topic" "sns_topic" {
  name = "alarm_topic"
}

resource "aws_sns_topic_subscription" "cpu_alarm_subscription" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = "asem.student.321@gmail.com" 
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name                = "cpu_usage_alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "This metric monitors the CPU utilization of the EC2 instance"
  actions_enabled           = true
  alarm_actions             = [aws_sns_topic.sns_topic.arn]
  dimensions = {
    InstanceId = var.ec2_id   # ec2 id
  }
}
