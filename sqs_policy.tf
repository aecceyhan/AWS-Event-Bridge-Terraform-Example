resource "aws_sqs_queue_policy" "schedule-event-policy" {
  queue_url = aws_sqs_queue.scheduled-event-q.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["sqs:SendMessage", "sqs:ReceiveMessage"],
      "Resource": "${aws_sqs_queue.scheduled-event-q.arn}"
    }
  ]
}
POLICY
}
