locals {
  # List of VMs and their Internal IPs
  # | VM Name                | Internal IP |
  # |------------------------|-------------|
  # | self-bastion           | 10.0.1.2    |
  # | baklava-proxy-0        | 10.0.1.5    |
  # | baklava-validator-0    | 10.0.2.4    |
  # | validator-0            | 10.0.2.3    |
  # | proxy-0                | 10.0.1.4    |

  rules = {

    ### VM: self-bastion ###
  "self-bastion_ram-used" = {
    expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.2:9100\", job=\"self-bastion\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.2:9100\", job=\"self-bastion\"}[$__rate_interval]))"
    threshold           = 90
    firing_frequency    = "1m"
    threshold_direction = "gt"
    severity            = "critical"
    class               = "Memory"
    component           = "RAM"
    group               = "Celo - Atalma"
    summary             = "RAM usage is above 90%"
    source              = "https://monitor.celo.atalma.io"
    client              = "Celo - Atalma"
    client_url          = "https://monitor.celo.atalma.io"
    },
    "self-bastion_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.2:9100\", job=\"self-bastion\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.2:9100\", job=\"self-bastion\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Atalma"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "self-bastion_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.2:9100\", job=\"self-bastion\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.2:9100\", job=\"self-bastion\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.2:9100\", job=\"self-bastion\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Atalma"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "self-bastion_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.2:9100\", job=\"self-bastion\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.2:9100\", job=\"self-bastion\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: baklava-proxy-0 ###
    "baklava-proxy-0_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Atalma"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "baklava-proxy-0_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Atalma"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "baklava-proxy-0_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Atalma"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "baklava-proxy-0_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.5:9100\", job=\"baklava-proxy-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: baklava-validator-0 ###
    "baklava-validator-0_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Atalma"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "baklava-validator-0_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Atalma"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "baklava-validator-0_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Atalma"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "baklava-validator-0_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.2.4:9100\", job=\"baklava-validator-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: validator-0 ###
    "validator-0_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Atalma"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "validator-0_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.2.3:9100\", job=\"validator-0\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Atalma"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "validator-0_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Atalma"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "validator-0_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: proxy-0 ###
    "proxy-0_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-0\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-0\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Atalma"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "proxy-0_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.4:9100\", job=\"proxy-0\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.4:9100\", job=\"proxy-0\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Atalma"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "proxy-0_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-0\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-0\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-0\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Atalma"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    },
    "proxy-0_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Atalma"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
  }
}
