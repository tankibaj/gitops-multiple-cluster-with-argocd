output "id" {
  description = "The policy's ID"
  value       = element(concat(aws_iam_policy.this.*.id, [""]), 0)
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = element(concat(aws_iam_policy.this.*.arn, [""]), 0)
}

output "description" {
  description = "The description of the policy"
  value       = element(concat(aws_iam_policy.this.*.description, [""]), 0)
}

output "name" {
  description = "The name of the policy"
  value       = element(concat(aws_iam_policy.this.*.name, [""]), 0)
}

output "path" {
  description = "The path of the policy in IAM"
  value       = element(concat(aws_iam_policy.this.*.path, [""]), 0)
}

output "policy" {
  description = "The policy document"
  value       = element(concat(aws_iam_policy.this.*.policy, [""]), 0)
}