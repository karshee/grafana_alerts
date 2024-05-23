locals {
  # List of VMs and their Internal IPs, disk devices & network devices
  # | VM Name                | Internal IP | Network Devices        |
  # |------------------------|-------------|------------------------|
  # | self-bastion           | 10.0.1.2    | ens4, docker0, lo      |
  # | baklava-proxy-0        | 10.0.1.5    | ens3, docker0, lo      |
  # | baklava-validator-0    | 10.0.2.4    | ens3, docker0, lo      |
  # | validator-0            | 10.0.2.3    | ens3, docker0, lo      |
  # | proxy-0                | 10.0.1.4    | ens3, docker0, lo      |
  
  network_rules = {
    #Network traffic <= 0 mb/s
    ### VM: self-bastion ### Receive
    "self-bastion_ens4_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.2:9100\",job=\"self-bastion\",device=\"ens4\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on ens4 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "self-bastion_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.2:9100\",job=\"self-bastion\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    ### VM: self-bastion ### Transmit
    "self-bastion_ens4_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.2:9100\",job=\"self-bastion\",device=\"ens4\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on ens3 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "self-bastion_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.2:9100\",job=\"self-bastion\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: baklava-proxy-0 ### Receive
    "baklava-proxy-0_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.5:9100\",job=\"baklava-proxy-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-proxy-0_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.5:9100\",job=\"baklava-proxy-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-proxy-0_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.5:9100\",job=\"baklava-proxy-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    ### VM: baklava-proxy-0 ### Transmit
    "baklava-proxy-0_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.5:9100\",job=\"baklava-proxy-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-proxy-0_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.5:9100\",job=\"baklava-proxy-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-proxy-0_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.5:9100\",job=\"baklava-proxy-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: baklava-validator-0 ### Receive
    "baklava-validator-0_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.4:9100\",job=\"baklava-validator-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-validator-0_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.4:9100\",job=\"baklava-validator-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-validator-0_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.4:9100\",job=\"baklava-validator-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    ### VM: baklava-validator-0 ### Transmit
    "baklava-validator-0_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.4:9100\",job=\"baklava-validator-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-validator-0_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.4:9100\",job=\"baklava-validator-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "baklava-validator-0_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.4:9100\",job=\"baklava-validator-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
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
      group               = "Celo - Atalma"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "validator-0_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "validator-0_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
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
      group               = "Celo - Atalma"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "validator-0_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "validator-0_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.2.3:9100\",job=\"validator-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }

    ### VM: proxy-0 ### Receive
    "proxy-0_ens3_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on ens3 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "proxy-0_lo_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "proxy-0_docker0_receive" = {
      expression          = "irate(node_network_receive_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network received on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    ### VM: proxy-0 ### Transmit
    "proxy-0_ens3_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-0\",device=\"ens3\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on ens4 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "proxy-0_lo_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-0\",device=\"lo\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on loopback has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
    "proxy-0_docker0_transmit" = {
      expression          = "irate(node_network_transmit_bytes_total{instance=\"10.0.1.4:9100\",job=\"proxy-0\",device=\"docker0\"}[$__rate_interval])*8"
      threshold           = 1
      firing_frequency    = "5m"
      threshold_direction = "lt"
      severity            = "warning"
      class               = "Network"
      component           = "NIC"
      group               = "Celo - Atalma"
      summary             = "Network transmit on docker0 has dropped to zero"
      source              = "https://monitor.celo.atalma.io"
      client              = "Celo - Atalma"
      client_url          = "https://monitor.celo.atalma.io"
    }
  }
}