resource "google_monitoring_alert_policy" "instance_preemption" {
  display_name = "Instance Pre-emption"
  combiner     = "OR"
  conditions {
    display_name = "Instance Pre-emption"
    condition_matched_log {
      filter     = "operation.producer=\"compute.instances.preempted\""
    }
  }

  notification_channels = [ data.google_monitoring_notification_channel.eoc_notification_channel.name ]
  alert_strategy {
    notification_rate_limit {
      period = "3600s"
    }
  }
}