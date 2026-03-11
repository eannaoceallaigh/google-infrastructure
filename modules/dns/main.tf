resource "cloudflare_dns_record" "a_record" {
  zone_id = var.zone_id
  comment = "Added by Terraform"
  content = var.ip
  name    = var.component
  proxied = true
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "udp_srv_record" {
  zone_id = var.zone_id
  comment = "Added by Terraform"
  name    = "_ts3._udp.${var.component}"
  proxied = false
  ttl     = 1
  type    = "SRV"

  data = {
    port     = 31987
    target   = "${var.component}.${var.domain}"
    priority = 0
    weight   = 0
  }
}

resource "cloudflare_dns_record" "tcp_srv_record" {
  zone_id = var.zone_id
  comment = "Added by Terraform"
  name    = "_tsdns._tcp"
  proxied = false
  ttl     = 1
  type    = "SRV"

  data = {
    port     = 31987
    target   = "${var.component}.${var.domain}"
    priority = 0
    weight   = 0
  }
}

resource "cloudflare_dns_record" "tscheck_srv_record" {
  zone_id = var.zone_id
  comment = "Added by Terraform"
  name    = "_tscheck._tcp"
  proxied = false
  ttl     = 1
  type    = "SRV"

  data = {
    port     = 31080
    target   = "${var.component}.${var.domain}"
    priority = 0
    weight   = 0
  }
}