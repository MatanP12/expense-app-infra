output "aws_secretmanager_secret_arn" {
  value = aws_secretsmanager_secret.gitops_deploy_key.arn
}