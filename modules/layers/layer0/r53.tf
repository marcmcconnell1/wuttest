resource "aws_route53_zone" "internal" {
  name    = "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["environment"]}.${var.route53_domain_name}.${var.route53_name_internal_tld}"
  comment = "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["environment"]}.${var.route53_domain_name}.${var.route53_name_internal_tld}"

  force_destroy = true

  tags = merge(
    var.tags,
    { "Name" : "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["environment"]}.${var.route53_domain_name}.${var.route53_name_internal_tld}" },
  )
}
