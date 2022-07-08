# runtime-connector

The `runtime-connector` module provisions the IAM role that a Sym Runtime uses to execute a Flow.

This `Connector` will provision a single IAM role for the Sym Runtime to use at execution time.

By default, the Runtime only has permissions to assume roles that have a path that begins with `/sym/`, and only within a provided safelist of AWS accounts. The Runtime always includes the current AWS account in the safelist.

The role created for the Runtime uses an [External ID](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_common-scenarios_third-party.html), a best practice for invoking cross-account roles. This module will generate an External ID for you, unless you configure the `custom_external_id` to override it.

```hcl
module "runtime_connector" {
  source  = "symopsio/runtime-connector/sym"
  version = ">= 1.0.0"

  environment = "sandbox"
}
```
