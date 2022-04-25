module "policy" {
  source = "../../../iam-policy"

  # Policy name
  name        = "test-policy-module"
  description = "This is policy description"

  # A list of policy statements
  policy_statements = [
    {
      sid = "FullS3Access"

      effect    = "Allow"
      actions   = ["s3:*"]
      resources = ["arn:aws:eks:eu-central-1:101186014818:cluster/eks-dh"]
    },
    {
      sid = "FullEKSAccess"

      effect    = "Allow"
      actions   = ["eks:*"]
      resources = ["*"]
    },
  ]

  # Attaches an IAM policy to a single role arn
  attach_role_arn = "arn:aws:iam::10118601400:role/s3-eks-admin-role"

  # Attaches an IAM policy to a list of role name
  attach_role_names = ["s3-eks-admin-role", "ec2-admin-role"]

  # Attaches an IAM policy to a list of user name
  attach_user_names = ["petter", "alex"]

  # Attaches an IAM policy to a list of group name
  attach_group_names = ["devops", "hr"]

  tags = {
    Name      = "test-policy-module",
    terraform = true
  }
}