resource "helm_release" "argo_release" {
  name       = "${var.env}-matan-argo"
  namespace  = var.argo_namespace
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argo_cd_version
  depends_on = [kubernetes_namespace.argo_namespace]

  set {
    name = "configs.repositories[0].url"
    value = jsondecode(data.aws_secretsmanager_secret_version.gitlab_creds.secret_string)["repository"]
  }
  set {
    name = "configs.repositories[0].sshPrivateKey"
    value =  jsondecode(data.aws_secretsmanager_secret_version.gitlab_creds.secret_string)["deploy_key"]
  }
  set {
    name = "configs.repositories[0].type"
    value = "git"
  }

}


resource "kubernetes_namespace" "argo_namespace" {
  metadata {
    name = var.argo_namespace
  }
}

data "aws_secretsmanager_secret" "gitlab_ssh_secret" {
    arn=var.aws_secretmanager_secret_arn
}

data "aws_secretsmanager_secret_version" "gitlab_creds" {
  secret_id = data.aws_secretsmanager_secret.gitlab_ssh_secret.id
}
