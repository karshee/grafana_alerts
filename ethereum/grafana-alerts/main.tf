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
    key    = "grafana-alerts/terraform.state"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

provider "grafana" {
  url  = "https://monitor.ethereum.atalma.io/"
  auth = "github_automation:${var.grafana_key}"
}

provider "pagerduty" {
  token = var.pagerduty_api_key
}

###use local vars in expressions

locals {
  host = "localhost:${local.host_port}"
  host_port = 9100
  job_name = "node"
  rules = {
    "ram-used" = {
      firing_frequency = var.ram_used_firing_frequency
      expression = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"${local.host}\",job=\"${local.job_name}\"}[${var.ram_used_firing_frequency}]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"localhost:9100\",job=\"node\"}[1m]))"
      threshold  = 90
      threshold_direction = "gt"
    }
    "cpu-usage" = {
      expression = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"${local.host}\",job=\"${local.job_name}\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"localhost:9100\",job=\"node\"}[1m])))) * 100",
      threshold  = 5
      firing_frequency = "1m"
      threshold_direction = "gt"
    }
    "swap_used" = {
      expression = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"localhost:9100\",job=\"node\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"localhost:9100\",job=\"node\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"localhost:9100\",job=\"node\"}[$__rate_interval]) )) * 100"
      threshold  = 75
      firing_frequency = "1m"
      threshold_direction = "gt"
    }
    "rootfs_used" = {
      expression = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"localhost:9100\",job=\"node\",mountpoint=\"/\",fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"localhost:9100\",job=\"node\",mountpoint=\"/\",fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold  = 90
      firing_frequency = "1m"
      threshold_direction = "gt"
    }

    #I/O Utilization of each drive
    "io_utilization_sda" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"localhost:9100\", job=\"node\", device=\"sda\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
    }
    "io_utilization_sdb" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"localhost:9100\", job=\"node\", device=\"sdb\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
    }
    "io_utilization_nvme0n1" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"localhost:9100\", job=\"node\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
    }
    "io_utilization_nvme1n1" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"localhost:9100\", job=\"node\", device=\"nvme1n1\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
    }

    #Network traffic <= 0 mb/s
    "eno1_receive" = {
      expression = "irate(node_network_receive_bytes_total{instance=\"localhost:9100\",job=\"node\",device=\"eno1\"}[$__rate_interval])*8"
      threshold  = 1
      firing_frequency = "5m"
      threshold_direction = "lt"
    }
    "io_receive" = {
      expression = "irate(node_network_receive_bytes_total{instance=\"localhost:9100\",job=\"node\",device=\"lo\"}[$__rate_interval])*8"
      threshold  = 10
      firing_frequency = "5m"
      threshold_direction = "lt"
    }
    "eno1_transmit" = {
      expression = "irate(node_network_transmit_bytes_total{instance=\"localhost:9100\",job=\"node\",device=\"eno1\"}[$__rate_interval])*8"
      threshold  = 1
      firing_frequency = "5m"
      threshold_direction = "lt"
    }
    "io_transmit" = {
      expression = "irate(node_network_transmit_bytes_total{instance=\"localhost:9100\",job=\"node\",device=\"lo\"}[$__rate_interval])*8"
      threshold  = 1
      firing_frequency = "5m"
      threshold_direction = "gt"
    }
  }
}

module "grafana" {
  source = "../../modules/grafana-alerts"
  env   = var.env
  rules = local.rules
  data_source_name = "Prometheus - Ethereum Mainnet"
  pagerduty_integration_key = var.pagerduty_integration_key
}