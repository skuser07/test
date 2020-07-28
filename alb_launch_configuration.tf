resource "aws_launch_configuration" "user07_web" {
  name_prefix = "user07-autoscaling-web-"

  image_id = "${var.amazon_linux}"
  instance_type = "t2.micro"
  key_name = "${var.dev_keyname}"
  security_groups = [
    "${aws_security_group.user07_allow_http.id}",
    "${aws_default_security_group.user07_dev_default.id}",
  ]
  associate_public_ip_address = true
    
  user_data = <<USER_DATA
#!/bin/bash
yum update
yum -y install httpd
echo "<html>" > /var/www/html/index.html
echo "Hello" >> /var/www/html/index.html
echo "<p> SERVER IP: $(curl http://169.254.169.254/latest/meta-data/local-ipv4) </p>" >> /var/www/html/index.html
echo "<img src=\"CloudFront URL\">" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html
systemctl start httpd.service
systemctl enable httpd.service

yum install -y aws-cli
yum install -y git
cd /home/ec2-user/
yum -y update
sudo yum -y install ruby# sudo
yum -y install wget
wget https://aws-codedeploy-ap-northeast-1.s3.amazonaws.com/latest/codedeploy-
agent.noarch.rpm

yum -y install codedeploy-agent.noarch.rpm
systemctl  start codedeploy-agent.service
  USER_DATA
  
  lifecycle {
    create_before_destroy = true
  }
}
