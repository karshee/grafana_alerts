locals {
  # List of VMs and their Internal IPs & disk devices
  # | VM Name      | Internal IP | Disk Device |
  # |--------------|-------------|-------------|
  # | Proxy-0      | 10.0.1.3    | nvme0n1     |
  # | Proxy-1      | 10.0.1.7    | nvme0n1     |
  # | Proxy-2      | 10.0.1.4    | nvme0n1     |
  # | Proxy-3      | 10.0.1.6    | nvme0n1     |
  # | Proxy-4      | 10.0.1.5    | nvme0n1     |
  # | Validator-0  | 10.0.2.3    | nvme0n1     |
  # | Validator-1  | 10.0.2.6    | nvme0n1     |
  # | Validator-2  | 10.0.2.4    | nvme0n1     |
  # | Validator-3  | 10.0.2.5    | nvme0n1     |
  # | Validator-4  | 10.0.2.2    | nvme0n1     |


  disk_rules = {
    #I/O Utilization of each drive
    ### VM: proxy-0 ###
    "proxy-0_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.3:9100\", job=\"proxy-0\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-1 ###
    "proxy-1_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.7:9100\", job=\"proxy-1\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-2 ###
    "proxy-2_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.4:9100\", job=\"proxy-2\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-3 ###
    "proxy-3_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.6:9100\", job=\"proxy-3\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-4 ###
    "proxy-4_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.1.5:9100\", job=\"proxy-4\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
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
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-1 ###
    "validator-1_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.2.6:9100\", job=\"validator-1\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-2 ###
    "validator-2_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.2.4:9100\", job=\"validator-2\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-3 ###
    "validator-3_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.2.5:9100\", job=\"validator-3\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-4 ###
    "validator-4_io_utilization_nvme0n1" = {
      expression          = "irate(node_disk_io_time_seconds_total{instance=\"10.0.2.2:9100\", job=\"validator-4\", device=\"nvme0n1\"}[$__rate_interval])"
      threshold           = 95
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "warning"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk I/O is above 95%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
  }
}