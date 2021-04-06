data "aws_route53_zone" "my_dns" {
  name = var.domain
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.my_dns.zone_id
  name    = var.subdomain
  type    = "CNAME"
  ttl     = "5"

  records = [aws_elastic_beanstalk_environment.tfenvtest.cname]

  depends_on = [
    aws_elastic_beanstalk_environment.tfenvtest
  ]
}