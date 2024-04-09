variable "env" {
  description = "environment name"
  type        = string
}

variable "data_source_name" {
  description = "name of the data source"
  type        = string
}

variable "rules" {
  description = "A map of rule definitions for creating alert rules."
  type = map(object({
    expression           : string
    threshold            : number
    firing_frequency     : string
    threshold_direction  : string  # "lt" for less than, "gt" for greater than
  }))
}

variable "pagerduty_integration_key" {
  description = "pagerduty integration key"
  type        = string
  default     = ""
  sensitive   = true
}

variable "notification_email_addresses" {
  type        = list(string)
  description = "List of email addresses for alert notifications."
  default     = []
}

variable "disable_resolve_message" {
  type        = bool
  description = "Disable sending resolve messages when the alert condition is no longer true"
  default     = false
}

variable "datasource_type" {
  description = "datasource type if not prometheus"
  type        = string
  default     = "prometheus"
}