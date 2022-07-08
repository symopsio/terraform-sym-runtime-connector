variable "account_id_safelist" {
  description = "List of addtional AWS account ids (beyond the current AWS account) that the runtime can assume roles in."
  type        = list(string)
  default     = []
}

variable "addons" {
  description = "List of Sym addon permissions for the runtime connector role. Addons give the runtime permissions to work with other resources without assuming another AWS role."
  type        = list(string)
  default     = []

  validation {
    condition     = length(setsubtract(var.addons, ["aws/secretsmgr", "aws/kinesis-firehose", "aws/kinesis-data-stream"])) == 0
    error_message = "Unsupported addon value."
  }
}

variable "custom_external_id" {
  description = "The external ID to use for AWS assume role validation. If unspecified, the connector generates an external ID and the Sym platform ensures it is unique."
  default     = ""
  type        = string
}

variable "environment" {
  description = "An environment qualifier for the resources this module creates, to support a Terraform SDLC."
  type        = string
}

variable "policy_arns" {
  description = "Map of logical identifiers to additional IAM Managed Policy ARNs to add to the runtime connector role. The identifiers are only used for managing Terraform state."
  type        = map(string)
  default     = {}
}

variable "sym_account_ids" {
  description = "List of account ids that can assume the runtime role. By default, only Sym production accounts can assume the runtime role."
  type        = list(string)
  default     = ["803477428605"]
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "addon_params" {
  description = "Additional parameters for selected addons"
  type        = map(map(any))
  default     = {}
}
