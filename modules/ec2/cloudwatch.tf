resource "aws_sns_topic" "cpu_high" {
  name = "ec2-cpu-high-topic"
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "EC2CPUHigh"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This metric monitors EC2 CPU usage"
  alarm_actions       = [aws_sns_topic.cpu_high.arn]
  dimensions = {
    InstanceId = aws_instance.app_server.id
  }
}