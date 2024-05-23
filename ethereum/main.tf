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
    key    = "eth/grafana-alerts/terraform.state"
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

locals {
  host = "localhost:${local.host_port}"
  host_port = 9100
  job_name = "node"
  rules = {
    "ram-used" = {
      expression = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"${local.host}\",job=\"${local.job_name}\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"${local.host}\",job=\"${local.job_name}\"}[$__rate_interval]))"
      threshold  = 90
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "critical"
      class              = "Memory"
      component          = "RAM"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "RAM usage is above 90%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"
    }
    "cpu-usage" = {
      expression = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"${local.host}\",job=\"${local.job_name}\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"${local.host}\",job=\"${local.job_name}\"}[1m])))) * 100",
      threshold  = 90
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "critical"
      class              = "Compute"
      component          = "CPU"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "CPU usage is above 90%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"      
    }
    "swap_used" = {
      expression = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"${local.host}\",job=\"${local.job_name}\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"${local.host}\",job=\"${local.job_name}\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"${local.host}\",job=\"${local.job_name}\"}[$__rate_interval]) )) * 100"
      threshold  = 75
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "critical"
      class              = "Memory"
      component          = "SWAP"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Swap usage is above 75%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"            
    }
    "rootfs_used" = {
      expression = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"${local.host}\",job=\"${local.job_name}\",mountpoint=\"/\",fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"${local.host}\",job=\"${local.job_name}\",mountpoint=\"/\",fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold  = 90
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "critical"
      class              = "Storage"
      component          = "HDD"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Disk usage is above 90%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"                  
    }

    #I/O Utilization of each drive
    "io_utilization_sda" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"${local.host}\", job=\"${local.job_name}\", device=\"sda\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "warning"
      class              = "Storage"
      component          = "HDD"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Disk I/O is above 95%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"              
    }
    "io_utilization_sdb" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"${local.host}\", job=\"${local.job_name}\", device=\"sdb\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "warning"
      class              = "Storage"
      component          = "HDD"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Disk I/O is above 95%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"              
    }
    "io_utilization_nvme0n1" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"${local.host}\", job=\"${local.job_name}\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "warning"
      class              = "Storage"
      component          = "HDD"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Disk I/O is above 95%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"              
    }
    "io_utilization_nvme1n1" = {
      expression = "irate(node_disk_io_time_seconds_total{instance=\"${local.host}\", job=\"${local.job_name}\", device=\"nvme1n1\"}[$__rate_interval])"
      threshold  = 95
      firing_frequency = "1m"
      threshold_direction = "gt"
      severity           = "warning"
      class              = "Storage"
      component          = "HDD"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Disk I/O is above 95%"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"              
    }

    #Network traffic <= 0 mb/s
    "eno1_receive" = {
      expression = "irate(node_network_receive_bytes_total{instance=\"${local.host}\",job=\"${local.job_name}\",device=\"eno1\"}[$__rate_interval])*8"
      threshold  = 1
      firing_frequency = "5m"
      threshold_direction = "lt"
      severity           = "warning"
      class              = "Network"
      component          = "NIC"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Network received on eno1 has dropped to zero"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"              
    }
    "lo_receive" = {
      expression = "irate(node_network_receive_bytes_total{instance=\"${local.host}\",job=\"${local.job_name}\",device=\"lo\"}[$__rate_interval])*8"
      threshold  = 1
      firing_frequency = "5m"
      threshold_direction = "lt"
      severity           = "warning"
      class              = "Network"
      component          = "NIC"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Network received on loopback has dropped to zero"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"        
    }
    "eno1_transmit" = {
      expression = "irate(node_network_transmit_bytes_total{instance=\"${local.host}\",job=\"${local.job_name}\",device=\"eno1\"}[$__rate_interval])*8"
      threshold  = 1
      firing_frequency = "5m"
      threshold_direction = "lt"
      severity           = "warning"
      class              = "Network"
      component          = "NIC"
      group              = "Ethereum Mainnet (Latitude)"
      summary            = "Network transmit on eno1 has dropped to zero"
      source             = "https://monitor.ethereum.atalma.io"
      client             = "Ethereum"
      client_url         = "https://monitor.ethereum.atalma.io"        
    }
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
}

module "grafana" {
  source = "../modules/grafana-alerts"
  env   = "eth"
  rules = local.rules
  data_source_name = "Prometheus - Ethereum Mainnet"
  pagerduty_integration_key = var.pagerduty_integration_key
}