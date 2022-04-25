resource "aws_iam_policy" "this" {
  count = var.create_policy ? 1 : 0

  name        = var.name
  description = var.description
  path        = var.path
  policy      = data.aws_iam_policy_document.this[0].json
  tags        = var.tags
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
resource "aws_iam_role_policy_attachment" "this" {
  count = var.create_policy && (length(var.attach_role_arn) > 0) ? 1 : 0

  role       = var.attach_role_arn
  policy_arn = aws_iam_policy.this[0].arn

  depends_on = [aws_iam_policy.this]
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment
resource "aws_iam_policy_attachment" "this" {
  #  count = var.create_policy ? 1 : 0 && (var.attach_users_arns != null || var.attach_role_arns != null || var.attach_groups_arns != null) ? 1 : 0
  count = var.create_policy && (length(var.attach_user_names) > 0 || length(var.attach_role_names) > 0 || length(var.attach_group_names) > 0) ? 1 : 0

  name       = aws_iam_policy.this[0].name
  users      = var.attach_user_names
  roles      = var.attach_role_names
  groups     = var.attach_group_names
  policy_arn = aws_iam_policy.this[0].arn

  depends_on = [aws_iam_policy.this]
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "this" {
  count = var.create_policy ? 1 : 0

  dynamic "statement" {
    for_each = var.policy_statements

    content {
      sid           = try(statement.value.sid, null)
      effect        = try(statement.value.effect, null)
      actions       = try(statement.value.actions, null)
      not_actions   = try(statement.value.not_actions, null)
      resources     = try(statement.value.resources, null)
      not_resources = try(statement.value.not_resources, null)

      dynamic "principals" {
        for_each = try(statement.value.principals, [])

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = try(statement.value.not_principals, [])

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = try(statement.value.conditions, [])

        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}