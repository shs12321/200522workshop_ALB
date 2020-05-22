## 1번 인스턴스 소스
resource "aws_instance" "user10_r1_ins1" {
    ami = "ami-0f7919c33c90f5b58" #Amazon Linux 2 AMI (HVM), SSD Volume Type
    availability_zone = "us-east-2a"
    instance_type = "t2.micro"
    key_name = aws_key_pair.user10-terraform-key.key_name
    vpc_security_group_ids = [aws_security_group.user10_r1_sg.id,
    aws_default_security_group.user10_r1_sg_default.id]
    #수정
    subnet_id = aws_subnet.user10_r1_sub1.id
    associate_public_ip_address = true
    # httpd 설치 스크립트 복사
    provisioner "file" {
        source      = "script.sh"
        destination = "/tmp/script.sh"
    }
    # httpd 설치 스크립트 실행 권한 부여 및 실행
    provisioner "remote-exec" {
    inline = [
      #"chmod +x /tmp/script.sh",
      #"sudo /tmp/script.sh"
    ]
    }
    connection {
        host        = coalesce(self.public_ip, self.private_ip)
        user        = var.INSTANCE_USERNAME
        private_key = file(var.PATH_TO_PRIVATE_KEY)
    }
    #수정
    tags = {
        Name = "user10_r1_ins1"
    }
}

resource "aws_key_pair" "user10-terraform-key" {
  key_name   = "user10-terraform-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  lifecycle {
    ignore_changes = [tags]
  }
}

#두번째 인스턴스 소스
resource "aws_instance" "user10_r1_ins2" {
    ami = "ami-0f7919c33c90f5b58" #Amazon Linux 2 AMI (HVM), SSD Volume Type
    availability_zone = "us-east-2b"
    instance_type = "t2.micro"
    key_name = aws_key_pair.user10-terraform-key.key_name
    vpc_security_group_ids = [aws_security_group.user10_r1_sg.id,
    aws_default_security_group.user10_r1_sg_default.id]
    #수정
    subnet_id = aws_subnet.user10_r1_sub2.id
    associate_public_ip_address = true
    # httpd 설치 스크립트 실행 권한 부여 및 실행
    provisioner "file" {
        source      = "script.sh"
        destination = "/tmp/script.sh"
    }
    # httpd 설치 스크립트 실행 권한 부여 및 실행
    provisioner "remote-exec" {
    inline = [
      #"chmod +x /tmp/script.sh",
      #"sudo /tmp/script.sh"
    ]
    }
    connection {
        host        = coalesce(self.public_ip, self.private_ip)
        user        = var.INSTANCE_USERNAME
        private_key = file(var.PATH_TO_PRIVATE_KEY)
    }
    tags = {
        Name = "user10_r1_ins2"
    }
}

#완료 후 공인 IP 출력
output "public_ip_r1_ins1" {
  value = aws_instance.user10_r1_ins1.public_ip
}
#완료 후 공인 IP 출력
output "public_ip_r1_ins2" {
  value = aws_instance.user10_r1_ins2.public_ip
}

#아마존 리눅스에서 웹서버httpd 설치법
#sudo su -
#yum update -y
#yum install httpd -y
#systemctl start httpd.service
#systemctl status httpd.service
#cd /var/www/html/
#echo "<html> Hello <img src=http://d111111abcdef8.cloudfront.net/images/image.jpg> </html>" > index.html

#우분투에서 웹서버nginx 설치법
# user_data = <<USER_DATA

##!/bin/bash
#yum update
#yum -y install nginx
#echo "$(curl http://169.254.169.254/latest/meta-data/local-ipv4)" > /usr/share/nginx/html/index.html
#chkconfig nginx on
#service nginx start
#  USER_DATA

#  lifecycle {
#    create_before_destroy = true
#  }
