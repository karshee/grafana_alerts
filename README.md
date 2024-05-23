# Grafana-Alerts Terraform Repository Documentation

This README provides a comprehensive guide to managing Grafana alerts configurations across different environments using Terraform.

## Repository Structure

The repository is organized into the following directories:

- **`celo-atalma`**: Terraform configurations for the Celo Atalma environment.
- **`celo-impact`**: Terraform configurations for the Celo Impact environment.
- **`ethereum`**: Terraform configurations for the Ethereum environment.
- **`modules`**: Reusable Terraform modules for Grafana alerts.

## Continuous Integration and Deployment (CI/CD)

The CI/CD pipeline is configured as follows:

- **Plan**: A Terraform plan is executed on any commit to any branch, showing potential changes.
- **Apply**: Changes are applied only when merged to the main branch, ensuring it remains deployable.

## Adding a New Environment

To add a new environment to the Grafana-alerts configuration, follow these steps:

### 1. Create a New Environment Folder
- Create a new folder named after the environment (e.g., `new-environment`). (important that folder name and env name is the same)
- Add Terraform configuration files that utilize the common modules by referencing `../modules/grafana-alerts`.

### 2. Set Up Secrets
- Add the Grafana 'github_automation' user's password as a secret named `GRAFANA_USER_PASSWORD_ENV`, replacing `ENV` with the uppercase name of your environment (e.g., `GRAFANA_USER_PASSWORD_NEW_ENVIRONMENT`).
- Note: 'github_automation' user requires Admin privileges to create alerts and folders.

### 3. Update CI/CD Workflow
- Modify `.github/workflows/grafana_alarms.yml` to include the new environment in the environment matrix.

### 4. Create a 'destroy' workflow (OPTIONAL)
- Copying `.github/workflows/grafana_destroy_eth.yml`, create a workflow for destroying the environment.

#### Example Configuration

Here's how you can reference the Grafana alerts module in your Terraform configuration:

```hcl
module "grafana" {
  source = "../modules/grafana-alerts"
  env   = "eth"
  rules = local.rules
  data_source_name = "Prometheus - Ethereum Mainnet"
  pagerduty_integration_key = var.pagerduty_integration_key
}
```
