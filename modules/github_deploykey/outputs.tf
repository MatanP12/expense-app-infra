output "repository_ssh_url" {
  value = "git@github.com:${var.repository_owner}/${var.repository_name}.git"
  sensitive = true
}

output "deploy_key" {
  value = tls_private_key.deploy_key.private_key_openssh
  sensitive = true
}
