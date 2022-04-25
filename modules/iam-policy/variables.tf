variable "create_policy" {
  description = "Whether to create the IAM policy"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the policy"
  type        = string
}

variable "path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "tags" {
  description = "A map of tags to add to IAM role resources"
  type        = map(string)
  default     = {}
}

variable "policy_statements" {
  description = "A list of policy statements"
  type        = list(any)
}

variable "attach_role_arn" {
  description = "The arn of the IAM role to which the policy should be applied"
  type        = string
  default     = ""
}

variable "attach_user_names" {
  description = "The name of the IAM users to which the policy should be applied"
  type        = list(string)
  default     = []
}

variable "attach_role_names" {
  description = "The name of the IAM roles to which the policy should be applied"
  type        = list(string)
  default     = []
}

variable "attach_group_names" {
  description = "The name of the IAM groups to which the policy should be applied"
  type        = list(string)
  default     = []
}