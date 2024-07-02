resource "aws_elastic_beanstalk_application" "eb_app" {
  name        = "kristine-eb-app"   #Change this to your name
}

resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                = "kristine-eb-app-env"   #Change this to your name
  application         = aws_elastic_beanstalk_application.eb_app.name
  solution_stack_name = "64bit Amazon Linux 2023 v6.1.6 running Node.js 20"

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
      namespace = "aws:elasticbeanstalk:environment"
      name = "EnvironmentType"
      value = "SingleInstance"
  }
  setting {
      namespace = "aws:elasticbeanstalk:environment"
      name = "ServiceRole"
      value = "arn:aws:iam::255945442255:role/service-role/aws-elasticbeanstalk-service-role"
  }
  setting {
      namespace = "aws:ec2:instances"
      name = "InstanceTypes"
      value = "t2.micro"
  }
}