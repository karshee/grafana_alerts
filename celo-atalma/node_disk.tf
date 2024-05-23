locals {
  # List of VMs and their Internal IPs & disk devices
  # | VM Name                | Internal IP | Disk Device |
  # |------------------------|-------------|-------------|
  # | self-bastion           | 10.0.1.2    | sda         |
  # | baklava-proxy-0        | 10.0.1.5    | nvme0n1     |
  # | baklava-validator-0    | 10.0.2.4    | nvme0n1     |
  # | validator-0            | 10.0.2.3    | nvme0n1     |
  # | proxy-0                | 10.0.1.4    | nvme0n1     |

  disk_rules = {
    #I/O Utilization of each drive
    ### VM: self-bastion ###
    "self-bastion_io_utilization_sda" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.2:9100\", job=\"self-bastion\", device=\"sda\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: baklava-proxy-0 ###
    "baklava-proxy-0_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: baklava-validator-0 ###
    "baklava-validator-0_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: validator-0 ###
    "validator-0_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.2.3:9100\", job=\"validator-0\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: proxy-0 ###
    "proxy-0_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.4:9100\", job=\"proxy-0\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
  }
}