terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.28.2"
    }
  }
}

locals {
  default_firing_frequency = "1m"
}

# Define a folder to contain the alert rule group
resource "grafana_folder" "rule_folder" {
  title = "${var.env}_alert_rules"
}

# Data source block to fetch the UID of the Prometheus data source from Grafana
data "grafana_data_source" "prometheus" {
  name = var.data_source_name
}

resource "grafana_rule_group" "rule_groups" {
  for_each         = var.rules
  name             = each.key
  folder_uid       = grafana_folder.rule_folder.uid
  interval_seconds = 60

  rule {
    name      = each.key
    condition = "C"

    data {
      ref_id = "A"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = data.grafana_data_source.prometheus.uid
      model = jsonencode({
        datasource  = {
          type = var.datasource_type,
          uid  = data.grafana_data_source.prometheus.uid
        },
        editorMode  = "code",
        expr        = each.value.expression,
        instant     = true,
        intervalMs  = 1000,
        legendFormat = "__auto",
        maxDataPoints = 43200,
        range       = false,
        refId       = "A"
      })
    }

    data {
      ref_id = "C"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = "__expr__"
      model = jsonencode({
        conditions = [
          {
            evaluator = {
              params = [each.value.threshold],
              type   = each.value.threshold_direction
            },
            operator = {
              type = "and"
            },
            query = {
              params = ["A"]
            },
            reducer = {
              params = [],
              type   = "last"
            },
            type = "query"
          }
        ],
        datasource = {
          type = "__expr__",
          uid  = "__expr__"
        },
        expression  = "A",
        intervalMs  = 1000,
        maxDataPoints = 43200,
        refId       = "C",
        type        = "threshold"
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = lookup(each.value, "firing_frequency", local.default_firing_frequency)
    annotations = {
      description = "${var.env} ${each.key} alert"
      runbook_url = ""
      summary     = ""
    }
    labels = {
      severity = "high"
    }
    is_paused = false
  }
}

resource "pagerduty_incident_custom_field" "false_alarm" {
  name          = "false_alarm"
  display_name  = "False Alarm"
  data_type     = "boolean"
  field_type    = "single_value"
  default_value = "false"
}
