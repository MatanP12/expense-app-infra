resource "aws_secretsmanager_secret" "gitops_deploy_key" {
  recovery_window_in_days = 0
  name = "${var.env}-${var.secret_name}"
}

resource "aws_secretsmanager_secret_version" "secret_value" {
  secret_id = aws_secretsmanager_secret.gitops_deploy_key.id
  secret_string = local.json_string
}

locals {
  json_string = jsonencode({
    repository= "${var.repository_ssh}"
    deploy_key="${trim("${var.deploy_key}","\n")}"
  })
}
