
resource "tls_private_key" "deploy_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "github_repository_deploy_key" "argocd" {
  title = "${var.env}-${var.deploy_key_name}"
  repository = var.repository_name
  key = tls_private_key.deploy_key.public_key_openssh
  read_only = true
}