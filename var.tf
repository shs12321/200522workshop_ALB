variable "amazon_linux" {
# us-east-2 Amazon Linux AMI 2018.11.19 (HVM), SSD Volume Type - ami-0b59bfac6be064b78
# Ubuntu 16.04 - ami-d39a02b5”
# default 값일 뿐 설정안하면 그때 적용됨.
    default = "ami-0f391a6a"
}
variable "dev_keyname" {
    default = "default-key"
}
#확인 https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html
variable "alb_account_id" {
    # us-esat-2
    #AWS의 IAM에서 내 계정의 사용자 ARN 값 확인
    default = "033677994240"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/home/ec2-user/environment/id_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/home/ec2-user/environment/id_rsa.pub"
}
