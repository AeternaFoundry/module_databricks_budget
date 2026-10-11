variable "budgets" {
  description = <<EOT
Map of budgets, attributes below
Optional:
    - account_id
    - budget_configuration_id
    - create_time
    - display_name
    - resource_type
    - update_time
    - alert_configurations (block):
        - action_configurations (optional, block):
            - action_configuration_id (optional)
            - action_type (optional)
            - target (optional)
        - alert_configuration_id (optional)
        - principal_overrides (optional, block):
            - override_threshold (optional)
            - principal_id (optional)
        - quantity_threshold (optional)
        - quantity_type (optional)
        - scope_type (optional)
        - time_period (optional)
        - trigger_type (optional)
    - filter (block):
        - tags (optional, block):
            - key (optional)
            - value (optional, block):
                - operator (optional)
                - values (optional)
        - workspace_id (optional, block):
            - operator (optional)
            - values (optional)
EOT

  type = map(object({
    account_id              = optional(string)
    budget_configuration_id = optional(string)
    create_time             = optional(number)
    display_name            = optional(string)
    resource_type           = optional(string)
    update_time             = optional(number)
    alert_configurations = optional(list(object({
      action_configurations = optional(list(object({
        action_configuration_id = optional(string)
        action_type             = optional(string)
        target                  = optional(string)
      })))
      alert_configuration_id = optional(string)
      principal_overrides = optional(list(object({
        override_threshold = optional(string)
        principal_id       = optional(number)
      })))
      quantity_threshold = optional(string)
      quantity_type      = optional(string)
      scope_type         = optional(string)
      time_period        = optional(string)
      trigger_type       = optional(string)
    })))
    filter = optional(object({
      tags = optional(list(object({
        key = optional(string)
        value = optional(object({
          operator = optional(string)
          values   = optional(list(string))
        }))
      })))
      workspace_id = optional(object({
        operator = optional(string)
        values   = optional(list(number))
      }))
    }))
  }))
}

