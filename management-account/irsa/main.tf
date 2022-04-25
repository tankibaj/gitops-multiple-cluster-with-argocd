module "irsa_argocd_management_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 4.18.0"

  create_role = true
  role_name   = "argocd-management"

  oidc_providers = {
    argocd = {
      provider_arn               = "arn:aws:iam::111111111111:oidc-provider/oidc.eks.eu-central-1.amazonaws.com/id/EA7D25DBCA77E5D8B7F65A172E64982F" # oidc provider arn of management eks cluster
      namespace_service_accounts = ["argocd:argocd-server", "argocd:argocd-application-controller"]
    }
  }

  role_policy_arns = [
    module.irsa_argocd_management_role_policy.arn
  ]

  tags = {
    terraform = true
  }
}

module "irsa_argocd_management_role_policy" {
  source = "../../modules/iam-policy"

  name = "irsa_argocd_management_role"

  policy_statements = [
    {
      sid       = "AssumeRole"
      effect    = "Allow"
      actions   = ["sts:AssumeRole"]
      resources = ["*"]
    },
  ]

  tags = {
    terraform = true
  }
}