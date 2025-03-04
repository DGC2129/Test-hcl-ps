resource "aws_iam_role" "iam-role" {
  name               = "ECS-execution-role"
  assume_role_policy = file("${path.module}/iam-role.json")
}

resource "aws_iam_role" "master" {
  name               = "EKS-iam-master-role"
  assume_role_policy = file("${path.module}/iam-role.json")
}

resource "aws_iam_role" "worker" {
  name               = "EKS-iam-worker-role"
  assume_role_policy = file("${path.module}/iam-role.json")
}