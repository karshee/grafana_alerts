
# Grafana Alerts Module

This Terraform module allows users to configure Grafana alert notifications via contact points such as email and PagerDuty. It includes resources for setting up Grafana contact points for email notifications, PagerDuty notifications, and alert rule groups for monitoring specific metrics.

## Requirements

- Terraform >= 0.12
- Grafana provider >= 1.28.2
- PagerDuty provider >= 3.9.0

## Provider Configuration

Ensure the Grafana provider is configured in your root Terraform configuration:

```hcl
provider "grafana" {
  url  = "http://localhost:3000"
  auth = "YOUR_AUTH_TOKEN"
}
provider "pagerduty" {
  token = "YOUR_PAGERDUTY_API_TOKEN"
}
```

## Module Input Variables

- `env`: The environment name (e.g., "production", "development").
- `rules`: A map of monitoring rules where each rule specifies an expression and a threshold.
- `data_source_name`: Name of the Grafana data source to use.
- `pagerduty_integration_key` (Optional): PagerDuty integration key for PagerDuty notifications.
- `notification_email_addresses` (Optional): List of email addresses for email alert notifications.
- `disable_resolve_message` (Optional): Whether to disable sending resolve messages when the alert condition is no longer true. Defaults to `false`.
- `datasource_type` (Optional): Datasource type if not Prometheus. Defaults to "prometheus".

## Usage Example

```hcl
module "grafana_alerts" {
  source = "./modules/grafana-alerts"

  env                      = "test"
  data_source_name         = "Prometheus - Ethereum Mainnet"
  notification_email_addresses = ["alert@example.com"]
  pagerduty_integration_key = "your_pagerduty_integration_key_here"
  rules = {
    "ram-used" = {
      expression           = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"localhost:9100\",job=\"node\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"localhost:9100\",job=\"node\"}[$__rate_interval]))",
      threshold            = 90,
      firing_frequency     = "1m",
      threshold_direction  = "gt"
    },
    "cpu-usage" = {
      expression           = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"localhost:9100\",job=\"node\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"localhost:9100\",job=\"node\"}[1m])))) * 100",
      threshold            = 80,
      firing_frequency     = "1m",
      threshold_direction  = "gt"
    }
  }
}

```

## Notifications Configuration

- **Email Notifications**: Ensure Grafana's SMTP settings are configured in `grafana.ini` for email notifications to work.
- **PagerDuty Notifications**: Provide the PagerDuty integration key for PagerDuty notifications.

## Additional Information

This module creates contact points and notification policies based on the provided inputs. At least one notification method (PagerDuty or email addresses) must be configured. The module validates the setup and will fail if no notification method is set.

For detailed documentation on each input variable and module functionality, refer to the `variables.tf` file within the module directory.
