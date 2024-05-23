
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
module "grafana" {
  source = "../modules/grafana-alerts"

  env   = "eth"
  rules = {
    "lo_transmit" = {
      expression = "irate(node_network_transmit_bytes_total{instance=\"${local.host}\",job=\"${local.job_name}\",device=\"lo\"}[$__rate_interval])*8"
      threshold  = 1
      firing_frequency = "5m"
      threshold_direction = "lt"
      severity           = "warning"
      class              = "Network"
      component          = "NIC"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Network transmit on loopback has dropped to zero"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"
    }
  }
  data_source_name = "Prometheus - Ethereum Mainnet"
}
```

## Notifications Configuration

- **Email Notifications**: Ensure Grafana's SMTP settings are configured in `grafana.ini` for email notifications to work.
- **PagerDuty Notifications**: Provide the PagerDuty integration key for PagerDuty notifications.

## Additional Information

This module creates contact points and notification policies based on the provided inputs. At least one notification method (PagerDuty or email addresses) must be configured. The module validates the setup and will fail if no notification method is set.

For detailed documentation on each input variable and module functionality, refer to the `variables.tf` file within the module directory.
