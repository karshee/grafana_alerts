terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 2.13.0"
    }
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = ">= 3.9.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-grafana-alerts"
    key    = "celo-atalma/grafana-alerts/terraform.state"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

provider "grafana" {
  url  = "https://monitor.celo.atalma.io/"
  auth = "github_automation:${var.grafana_key}"
}

provider "pagerduty" {
  token = var.pagerduty_api_key
}

  # List of VMs and their Internal IPs, disk devices & network devices
  # | VM Name                | Internal IP | Disk Device | Network Devices        |
  # |------------------------|-------------|-------------|------------------------|
  # | Self-bastion           | 10.0.1.2    | sda         | ens4, docker0, lo      |
  # | Baklava-proxy-0        | 10.0.1.5    | nvme0n1     | ens3, docker0, lo      |
  # | Baklava-validator-0    | 10.0.2.4    | nvme0n1     | ens3, docker0, lo      |
  # | Validator-0            | 10.0.2.3    | nvme0n1     | ens3, docker0, lo      |
  # | Proxy-0                | 10.0.1.4    | nvme0n1     | ens3, docker0, lo      |


  #files and their associated alarms
  #node.tf:
  #- ram_used
  #- cpu-usage
  #- swap_used
  #- rootfs_used
  #
  #node_disk.tf:
  #- io_utilization(drive)
  #
  #node_network.tf:
  #- in(drive)
  #- out(drive)

module "grafana" {
  source = "../modules/grafana-alerts"
  env    = "Celo-Atalma"
  rules  = merge(local.rules, local.disk_rules, local.network_rules)
  data_source_name          = "Prometheus - Atalma Celo Validators"
  pagerduty_integration_key = var.pagerduty_integration_key
}