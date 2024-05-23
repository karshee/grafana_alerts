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
    key    = "celo-impact/grafana-alerts/terraform.state"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

provider "grafana" {
  url  = "https://monitor.impact-market.atalma.io/"
  auth = "github_automation:${var.grafana_key}"
}

provider "pagerduty" {
  token = var.pagerduty_api_key
}

# List of VMs and their Internal IPs, disk devices & network devices
# | VM Name      | Internal IP | Disk Device | Network Devices        |
# |--------------|-------------|-------------|------------------------|
# | Proxy-0      | 10.0.1.3    | nvme0n1     | ens3, docker0, lo      |
# | Proxy-1      | 10.0.1.7    | nvme0n1     | ens3, docker0, lo      |
# | Proxy-2      | 10.0.1.4    | nvme0n1     | ens3, docker0, lo      |
# | Proxy-3      | 10.0.1.6    | nvme0n1     | ens3, docker0, lo      |
# | Proxy-4      | 10.0.1.5    | nvme0n1     | ens3, docker0, lo      |
# | Validator-0  | 10.0.2.3    | nvme0n1     | ens3, docker0, lo      |
# | Validator-1  | 10.0.2.6    | nvme0n1     | ens3, docker0, lo      |
# | Validator-2  | 10.0.2.4    | nvme0n1     | ens3, docker0, lo      |
# | Validator-3  | 10.0.2.5    | nvme0n1     | ens3, docker0, lo      |
# | Validator-4  | 10.0.2.2    | nvme0n1     | ens3, docker0, lo      |

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
  data_source_name          = "Prometheus - Impact Market"
  pagerduty_integration_key = var.pagerduty_integration_key
}
