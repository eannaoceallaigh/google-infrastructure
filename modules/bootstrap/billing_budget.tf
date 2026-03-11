resource "google_billing_budget" "eoc_budget" {
  billing_account = data.google_billing_account.eoc_billing_account.id
  display_name    = "${var.project_name}-billing-budget"
  amount {
    specified_amount {
      currency_code = "GBP"
      units         = "5"
    }
  }
  threshold_rules {
    threshold_percent = 0.5
  }
  threshold_rules {
    threshold_percent = 0.9
  }

  budget_filter {
    calendar_period = "MONTH"
  }

  all_updates_rule {
    monitoring_notification_channels = [
      google_monitoring_notification_channel.eoc_notification_channel.id,
    ]
    disable_default_iam_recipients = true
  }
}

resource "google_monitoring_notification_channel" "eoc_notification_channel" {
  display_name = "${var.project_name}-notification-channel"
  project      = var.project_id
  type         = "email"

  labels = {
    email_address = var.email_address
  }
}