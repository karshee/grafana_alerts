variable "grafana_key" {
  description = "Grafana API key for ethereum dashboard"
  type = string
  sensitive = true
}

variable "pagerduty_api_key" {
  description = "PagerDuty API key"
  type = string
  sensitive = true
}

variable "pagerduty_integration_key" {
  description = "PagerDuty ethereum integration key"
  type = string
  sensitive  = true
}

variable "env" {
    description = "Environment"
    type = string
}

variable "ram_used_firing_frequency" {
  description = "ram_used_alarm firing frequency"
  type = string
  default = "1m"
}