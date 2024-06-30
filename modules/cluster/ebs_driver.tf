resource "aws_eks_addon" "ebs_csi_driver" {
    cluster_name = aws_eks_cluster.eks-cluster.name
    addon_name = "aws-ebs-csi-driver"
}


resource "kubernetes_storage_class" "ebs-class" {
  metadata {
    name = "gp3"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer"
  parameters = {
    "type" = "gp3"
  }
}