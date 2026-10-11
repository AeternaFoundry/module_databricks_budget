resource "databricks_budget" "budgets" {
  for_each = var.budgets

  account_id              = each.value.account_id
  budget_configuration_id = each.value.budget_configuration_id
  create_time             = each.value.create_time
  display_name            = each.value.display_name
  resource_type           = each.value.resource_type
  update_time             = each.value.update_time

  dynamic "alert_configurations" {
    for_each = each.value.alert_configurations != null ? each.value.alert_configurations : []
    content {
      dynamic "action_configurations" {
        for_each = alert_configurations.value.action_configurations != null ? alert_configurations.value.action_configurations : []
        content {
          action_configuration_id = action_configurations.value.action_configuration_id
          action_type             = action_configurations.value.action_type
          target                  = action_configurations.value.target
        }
      }
      alert_configuration_id = alert_configurations.value.alert_configuration_id
      dynamic "principal_overrides" {
        for_each = alert_configurations.value.principal_overrides != null ? alert_configurations.value.principal_overrides : []
        content {
          override_threshold = principal_overrides.value.override_threshold
          principal_id       = principal_overrides.value.principal_id
        }
      }
      quantity_threshold = alert_configurations.value.quantity_threshold
      quantity_type      = alert_configurations.value.quantity_type
      scope_type         = alert_configurations.value.scope_type
      time_period        = alert_configurations.value.time_period
      trigger_type       = alert_configurations.value.trigger_type
    }
  }

  dynamic "filter" {
    for_each = each.value.filter != null ? [each.value.filter] : []
    content {
      dynamic "tags" {
        for_each = filter.value.tags != null ? filter.value.tags : []
        content {
          key = tags.value.key
          dynamic "value" {
            for_each = tags.value.value != null ? [tags.value.value] : []
            content {
              operator = value.value.operator
              values   = value.value.values
            }
          }
        }
      }
      dynamic "workspace_id" {
        for_each = filter.value.workspace_id != null ? [filter.value.workspace_id] : []
        content {
          operator = workspace_id.value.operator
          values   = workspace_id.value.values
        }
      }
    }
  }
}

