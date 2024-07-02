output "app_name" {
  value = aws_elastic_beanstalk_application.eb_app.name
}

output "env_name" {
  value = aws_elastic_beanstalk_environment.eb_env.name
}

output "cname" {
  value = aws_elastic_beanstalk_environment.eb_env.cname
}