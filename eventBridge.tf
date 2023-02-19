resource "aws_scheduler_schedule" "every5minutes" {
  name       = "every5minutes"
  group_name = "default"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "rate(5 minutes)"

  target {
    arn      = aws_sqs_queue.scheduled-event-q.arn
    role_arn = aws_iam_role.event_bridge_sqs_role.arn

    input = jsonencode({
      MessageBody = "{\"key\":\"value\"}"
    })

  }
}
