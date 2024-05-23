locals {
  # List of VMs and their Internal IPs
  # | VM Name      | Internal IP |
  # |--------------|-------------|
  # | Proxy-0      | 10.0.1.3    |
  # | Proxy-1      | 10.0.1.7    |
  # | Proxy-2      | 10.0.1.3    |
  # | Proxy-3      | 10.0.1.6    |
  # | Proxy-4      | 10.0.1.5    |
  # | Validator-0  | 10.0.2.3    |
  # | Validator-1  | 10.0.2.6    |
  # | Validator-2  | 10.0.2.4    |
  # | Validator-3  | 10.0.2.5    |
  # | Validator-4  | 10.0.2.2    |


  rules = {
    
    ### VM: proxy-0 ###
    "proxy-0_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.3:9100\", job=\"proxy-0\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.3:9100\", job=\"proxy-0\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-0_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.3:9100\", job=\"proxy-0\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.3:9100\", job=\"proxy-0\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-0_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.3:9100\", job=\"proxy-0\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.3:9100\", job=\"proxy-0\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.3:9100\", job=\"proxy-0\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-0_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.3:9100\", job=\"proxy-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.3:9100\", job=\"proxy-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-1 ###
    "proxy-1_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.7:9100\", job=\"proxy-1\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.7:9100\", job=\"proxy-1\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-1_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.7:9100\", job=\"proxy-1\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.7:9100\", job=\"proxy-1\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-1_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.7:9100\", job=\"proxy-1\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.7:9100\", job=\"proxy-1\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.7:9100\", job=\"proxy-1\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-1_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.7:9100\", job=\"proxy-1\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.7:9100\", job=\"proxy-1\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-2 ###
    "proxy-2_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-2\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-2\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-2_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.4:9100\", job=\"proxy-2\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.4:9100\", job=\"proxy-2\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-2_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-2\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-2\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-2\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-2_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-2\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.4:9100\", job=\"proxy-2\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-3 ###
    "proxy-3_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.6:9100\", job=\"proxy-3\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.6:9100\", job=\"proxy-3\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-3_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.6:9100\", job=\"proxy-3\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.6:9100\", job=\"proxy-3\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-3_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.6:9100\", job=\"proxy-3\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.6:9100\", job=\"proxy-3\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.6:9100\", job=\"proxy-3\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-3_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.6:9100\", job=\"proxy-3\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.6:9100\", job=\"proxy-3\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-4 ###
    "proxy-4_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.1.5:9100\", job=\"proxy-4\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.1.5:9100\", job=\"proxy-4\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-4_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.1.5:9100\", job=\"proxy-4\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.1.5:9100\", job=\"proxy-4\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-4_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.5:9100\", job=\"proxy-4\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.1.5:9100\", job=\"proxy-4\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.1.5:9100\", job=\"proxy-4\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "proxy-4_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.1.5:9100\", job=\"proxy-4\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.1.5:9100\", job=\"proxy-4\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
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
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-0_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.2.3:9100\", job=\"validator-0\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-0_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-0_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.2.3:9100\", job=\"validator-0\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-1 ###
    "validator-1_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.2.6:9100\", job=\"validator-1\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.2.6:9100\", job=\"validator-1\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-1_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.2.6:9100\", job=\"validator-1\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.2.6:9100\", job=\"validator-1\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-1_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.6:9100\", job=\"validator-1\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.2.6:9100\", job=\"validator-1\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.6:9100\", job=\"validator-1\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-1_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.2.6:9100\", job=\"validator-1\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.2.6:9100\", job=\"validator-1\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-2 ###
    "validator-2_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.2.4:9100\", job=\"validator-2\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.2.4:9100\", job=\"validator-2\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-2_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.2.4:9100\", job=\"validator-2\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.2.4:9100\", job=\"validator-2\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-2_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.4:9100\", job=\"validator-2\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.2.4:9100\", job=\"validator-2\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.4:9100\", job=\"validator-2\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-2_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.2.4:9100\", job=\"validator-2\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.2.4:9100\", job=\"validator-2\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-3 ###
    "validator-3_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.2.5:9100\", job=\"validator-3\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.2.5:9100\", job=\"validator-3\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-3_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.2.5:9100\", job=\"validator-3\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.2.5:9100\", job=\"validator-3\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-3_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.5:9100\", job=\"validator-3\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.2.5:9100\", job=\"validator-3\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.5:9100\", job=\"validator-3\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-3_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.2.5:9100\", job=\"validator-3\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.2.5:9100\", job=\"validator-3\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-4 ###
    "validator-4_ram-used" = {
      expression          = "100 - ((avg_over_time(node_memory_MemAvailable_bytes{instance=\"10.0.2.2:9100\", job=\"validator-4\"}[$__rate_interval]) * 100) / avg_over_time(node_memory_MemTotal_bytes{instance=\"10.0.2.2:9100\", job=\"validator-4\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "RAM"
      group               = "Celo - Impact Market"
      summary             = "RAM usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-4_cpu-usage" = {
      expression          = "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"10.0.2.2:9100\", job=\"validator-4\", mode!=\"idle\"}[1m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"10.0.2.2:9100\", job=\"validator-4\"}[1m])))) * 100"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Compute"
      component           = "CPU"
      group               = "Celo - Impact Market"
      summary             = "CPU usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-4_swap_used" = {
      expression          = "((avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.2:9100\", job=\"validator-4\"}[$__rate_interval]) - avg_over_time(node_memory_SwapFree_bytes{instance=\"10.0.2.2:9100\", job=\"validator-4\"}[$__rate_interval])) / (avg_over_time(node_memory_SwapTotal_bytes{instance=\"10.0.2.2:9100\", job=\"validator-4\"}[$__rate_interval]))) * 100"
      threshold           = 75
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Memory"
      component           = "SWAP"
      group               = "Celo - Impact Market"
      summary             = "Swap usage is above 75%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    },
    "validator-4_rootfs_used" = {
      expression          = "100 - ((avg_over_time(node_filesystem_avail_bytes{instance=\"10.0.2.2:9100\", job=\"validator-4\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]) * 100) / avg_over_time(node_filesystem_size_bytes{instance=\"10.0.2.2:9100\", job=\"validator-4\", mountpoint=\"/\", fstype!=\"rootfs\"}[$__rate_interval]))"
      threshold           = 90
      firing_frequency    = "1m"
      threshold_direction = "gt"
      severity            = "critical"
      class               = "Storage"
      component           = "HDD"
      group               = "Celo - Impact Market"
      summary             = "Disk usage is above 90%"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
  }
}
