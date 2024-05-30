resource "helm_release" "argo_release" {
  name       = "${var.env}-matan-argo"
  namespace  = var.argo_namespace
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argo_cd_version
  depends_on = [kubernetes_namespace.argo_namespace]

}

resource "kubernetes_namespace" "argo_namespace" {
  metadata {
    name = var.argo_namespace
  }
}
