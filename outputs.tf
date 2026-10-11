output "budgets_id" {
  description = "Map of id values across all budgets, keyed the same as var.budgets except keys with no id are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "budgets_account_id" {
  description = "Map of account_id values across all budgets, keyed the same as var.budgets except keys with no account_id are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.account_id if v.account_id != null && length(v.account_id) > 0 }
}
output "budgets_alert_configurations" {
  description = "Map of alert_configurations values across all budgets, keyed the same as var.budgets except keys with no alert_configurations are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.alert_configurations if v.alert_configurations != null && length(v.alert_configurations) > 0 }
}
output "budgets_budget_configuration_id" {
  description = "Map of budget_configuration_id values across all budgets, keyed the same as var.budgets except keys with no budget_configuration_id are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.budget_configuration_id if v.budget_configuration_id != null && length(v.budget_configuration_id) > 0 }
}
output "budgets_create_time" {
  description = "Map of create_time values across all budgets, keyed the same as var.budgets except keys with no create_time are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.create_time if v.create_time != null }
}
output "budgets_display_name" {
  description = "Map of display_name values across all budgets, keyed the same as var.budgets except keys with no display_name are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "budgets_filter" {
  description = "Map of filter values across all budgets, keyed the same as var.budgets except keys with no filter are omitted"
  value       = { for k, v in databricks_budget.budgets : k => one(v.filter) if v.filter != null && length(v.filter) > 0 }
}
output "budgets_resource_type" {
  description = "Map of resource_type values across all budgets, keyed the same as var.budgets except keys with no resource_type are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.resource_type if v.resource_type != null && length(v.resource_type) > 0 }
}
output "budgets_update_time" {
  description = "Map of update_time values across all budgets, keyed the same as var.budgets except keys with no update_time are omitted"
  value       = { for k, v in databricks_budget.budgets : k => v.update_time if v.update_time != null }
}

