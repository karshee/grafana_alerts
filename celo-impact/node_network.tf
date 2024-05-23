locals {
  # List of VMs and their Internal IPs & network devices
  # | VM Name      | Internal IP | Network Devices        |
  # |--------------|-------------|------------------------|
  # | Proxy-0      | 10.0.1.3    | ens3, docker0, lo      |
  # | Proxy-1      | 10.0.1.7    | ens3, docker0, lo      |
  # | Proxy-2      | 10.0.1.4    | ens3, docker0, lo      |
  # | Proxy-3      | 10.0.1.6    | ens3, docker0, lo      |
  # | Proxy-4      | 10.0.1.5    | ens3, docker0, lo      |
  # | Validator-0  | 10.0.2.3    | ens3, docker0, lo      |
  # | Validator-1  | 10.0.2.6    | ens3, docker0, lo      |
  # | Validator-2  | 10.0.2.4    | ens3, docker0, lo      |
  # | Validator-3  | 10.0.2.5    | ens3, docker0, lo      |
  # | Validator-4  | 10.0.2.2    | ens3, docker0, lo      |

  
  network_rules = {
    #Network traffic <= 0 mb/s
    ### VM: proxy-0 ### Receive
    "proxy-0_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.3:9100\",job=\"proxy-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-0_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.3:9100\",job=\"proxy-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-0_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.3:9100\",job=\"proxy-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: proxy-0 ### Transmit
    "proxy-0_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.3:9100\",job=\"proxy-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-0_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.3:9100\",job=\"proxy-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-0_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.3:9100\",job=\"proxy-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-1 ### Receive
    "proxy-1_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.7:9100\",job=\"proxy-1\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-1_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.7:9100\",job=\"proxy-1\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-1_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.7:9100\",job=\"proxy-1\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: proxy-1 ### Transmit
    "proxy-1_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.7:9100\",job=\"proxy-1\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-1_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.7:9100\",job=\"proxy-1\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-1_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.7:9100\",job=\"proxy-1\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-2 ### Receive
    "proxy-2_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-2\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-2_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-2\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-2_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-2\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: proxy-2 ### Transmit
    "proxy-2_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-2\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-2_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-2\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-2_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-2\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-3 ### Receive
    "proxy-3_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.6:9100\",job=\"proxy-3\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-3_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.6:9100\",job=\"proxy-3\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-3_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.6:9100\",job=\"proxy-3\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: proxy-3 ### Transmit
    "proxy-3_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.6:9100\",job=\"proxy-3\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-3_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.6:9100\",job=\"proxy-3\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-3_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.6:9100\",job=\"proxy-3\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: proxy-4 ### Receive
    "proxy-4_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.5:9100\",job=\"proxy-4\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-4_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.5:9100\",job=\"proxy-4\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-4_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.5:9100\",job=\"proxy-4\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: proxy-4 ### Transmit
    "proxy-4_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.5:9100\",job=\"proxy-4\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-4_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.5:9100\",job=\"proxy-4\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "proxy-4_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.5:9100\",job=\"proxy-4\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-0 ### Receive
    "validator-0_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-0_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-0_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: validator-0 ### Transmit
    "validator-0_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-0_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-0_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-1 ### Receive
    "validator-1_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.6:9100\",job=\"validator-1\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-1_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.6:9100\",job=\"validator-1\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-1_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.6:9100\",job=\"validator-1\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: validator-1 ### Transmit
    "validator-1_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.6:9100\",job=\"validator-1\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-1_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.6:9100\",job=\"validator-1\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-1_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.6:9100\",job=\"validator-1\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-2 ### Receive
    "validator-2_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.4:9100\",job=\"validator-2\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-2_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.4:9100\",job=\"validator-2\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-2_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.4:9100\",job=\"validator-2\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: validator-2 ### Transmit
    "validator-2_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.4:9100\",job=\"validator-2\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-2_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.4:9100\",job=\"validator-2\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-2_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.4:9100\",job=\"validator-2\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-3 ### Receive
    "validator-3_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.5:9100\",job=\"validator-3\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-3_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.5:9100\",job=\"validator-3\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-3_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.5:9100\",job=\"validator-3\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: validator-3 ### Transmit
    "validator-3_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.5:9100\",job=\"validator-3\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-3_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.5:9100\",job=\"validator-3\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-3_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.5:9100\",job=\"validator-3\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }

    ### VM: validator-4 ### Receive
    "validator-4_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.2:9100\",job=\"validator-4\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-4_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.2:9100\",job=\"validator-4\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-4_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.2:9100\",job=\"validator-4\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    ### VM: validator-4 ### Transmit
    "validator-4_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.2:9100\",job=\"validator-4\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-4_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.2:9100\",job=\"validator-4\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
    "validator-4_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.2:9100\",job=\"validator-4\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Impact Market"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.impact-market.atalma.io"
      client              = "Celo - Impact Market"
      client_url          = "https://monitor.impact-market.atalma.io"
    }
  }
}