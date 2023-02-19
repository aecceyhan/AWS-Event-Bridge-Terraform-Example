resource "aws_sqs_queue" "scheduled-event-q" {
  name                      = "scheduled-event-q"
  delay_seconds             = 0
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Name        = "scheduled-event-q"
    Environment = var.environment
  }
}
