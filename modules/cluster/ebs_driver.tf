resource "aws_eks_addon" "ebs_csi_driver" {
    cluster_name = aws_eks_cluster.eks-cluster.name
    addon_name = "aws-ebs-csi-driver"
}

