resource "aws_eks_cluster" "eks-cluster" {
  name     = "${var.env}-matan-eks-cluster"
  role_arn = aws_iam_role.eks-iam-role.arn

  vpc_config {
    subnet_ids = var.subnets_id
  }

  depends_on = [
    aws_iam_role.eks-iam-role,
  ]
}


resource "aws_eks_node_group" "worker-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "${var.env}-matan-eks-node-group"
  node_role_arn   = aws_iam_role.worknodes-iam-roles.arn
  subnet_ids      = var.subnets_id
  instance_types  = [var.instance_type]

  tags_all = {
    "Name" = "${var.env}-node"
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  remote_access {
    source_security_group_ids = [var.instance_sg.id]
    ec2_ssh_key               = aws_key_pair.ec2_key.key_name
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly-Nodes,
  ]
}


resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.env}-matan-nodes-key"
  public_key = tls_private_key.private_key.public_key_openssh
}


resource "tls_private_key" "private_key" {
  algorithm = "ED25519"

}

resource "local_file" "file" {
  content =  tls_private_key.private_key.private_key_pem
  filename = "node_public_key.pem"
}