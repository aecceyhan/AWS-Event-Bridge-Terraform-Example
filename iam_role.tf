resource "aws_iam_role" "event_bridge_sqs_role" {
  name = "event_bridge_sqs_role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "scheduler.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "event_bridge_sqs_role"
    Environment = var.environment
  }
}