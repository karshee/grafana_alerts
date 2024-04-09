#### Validating a minimum of one notification method is set up
locals {
  validate_notification_setup = length(var.notification_email_addresses) > 0 || var.pagerduty_integration_key != "" ? true : false
}

resource "null_resource" "validation" {
  count = local.validate_notification_setup ? 0 : 1 # This will fail if no notification method is set up

  triggers = {
    "error" = "You must provide at least one notification method: a PagerDuty integration key or a list of email addresses."
  }
}


#################################
######## CONTACT POINTS #########
#################################

#### PagerDuty notification channel
resource "grafana_contact_point" "pagerduty_contact_point" {
  count = var.pagerduty_integration_key != "" ? 1 : 0
  name                = "${var.env}-PagerDuty"

  pagerduty {
    integration_key = var.pagerduty_integration_key
  }
}

resource "grafana_notification_policy" "pagerduty_policy" {
  count = var.pagerduty_integration_key != "" ? 1 : 0

  group_by      = ["${var.env}_alert_pagerduty_notification"]
  contact_point = grafana_contact_point.pagerduty_contact_point[0].name
}

#### Enabling Email Notifications
#resource "grafana_contact_point" "email_contact_point" {
#  count = length(var.notification_email_addresses) > 0 ? 1 : 0
#
#  name = "${var.env}-email-contact-point"
#
#  dynamic "email" {
#    for_each = length(var.notification_email_addresses) > 0 ? [1] : []
#    content {
#      addresses             = var.notification_email_addresses
#      // Message template for the email body when alerts are firing
#      message               = "{{ len .Alerts.Firing }} firing."
#      subject               = "{{ template \"default.title\" .}}"
#      single_email          = true
#      // Whether to disable sending resolve messages when the alert condition is no longer true
#      disable_resolve_message = var.disable_resolve_message
#    }
#  }
#}
#
#resource "grafana_notification_policy" "email_policy" {
#  count = length(var.notification_email_addresses) > 0 ? 1 : 0
#
#  group_by      = ["${var.env}_alert_email_notification"]
#  contact_point = grafana_contact_point.email_contact_point[0].name
#}