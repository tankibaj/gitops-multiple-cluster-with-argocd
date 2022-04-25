module "deployer_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4.18.0"

  create_role       = true
  role_name         = "deployer"
  role_requires_mfa = false

  trusted_role_arns = [
    "arn:aws:iam::111111111111:role/argocd-management", # irsa arn of management account. So that argocd-management irsa can assumes this role to deploy argocd application on the development eks cluster
#    "arn:aws:iam::000000000000:root" # Root account arn to debug deployer role of development account
  ]

  tags = {
    terraform = true
  }
}