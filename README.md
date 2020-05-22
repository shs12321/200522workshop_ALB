___        ______     ____ _                 _  ___  
/ \ \      / / ___|   / ___| | ___  _   _  __| |/ _ \
/ _ \ \ /\ / /\___ \  | |   | |/ _ \| | | |/ _` | (_) |
/ ___ \ V  V /  ___) | | |___| | (_) | |_| | (_| |\__, |
/_/   \_\_/\_/  |____/   \____|_|\___/ \__,_|\__,_|  /_/
-----------------------------------------------------------------


Hi there! Welcome to AWS Cloud9!

To get started, create some files, play with the terminal,
or visit https://docs.aws.amazon.com/console/cloud9/ for our documentation.

Happy coding!
=============================================================
#terraform 설치
'''
https://www.terraform.io/downloads.html(가서 보는거)
복사해서 Cloud9 명령줄에
wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
unzip terra~
./terraform

#아마존 접속을 위한 환경 변수 등록
'''
AWS - IAM - 액세스관리 - 사용자 - 본인계정 클 - 보안자격증명 - 액세스 만들기
$export AWS_ACCESS_KEY_ID = 액세스키 ID
$export AWS_SECRET_ACCESS_KEY = 비밀 액세스 키
'''

#콘솔창 새로 열때 terraform되는 path설정
'''
export PATH=$PATH:~/environment/
'''

#테라폼 리부팅할때도 적용되는 path 설정하기
'''
echo “export PATH=$PATH:~/environment/” > ~/.bash_profile
'''

# 인스턴스 접속을 위한 키 페어 생성
'''
ssh-keygen #엔터3번
chmod 400 /home/ec2-user/.ssh/id_rsa
cp /home/ec2-user/.ssh/id_rsa /home/ec2-user/environment/id_rsa
cp /home/ec2-user/.ssh/id_rsa.pub /home/ec2-user/environment/id_rsa.pub
'''

#평가할때는 22번 포트를 내 IP만 되게 해야함.

#생성된 인스턴스 CLI 접속법
'''
ssh -i id_rsa ec2-user@공인IP
'''


#인스턴스 yum업데이트 및 httpd 설치 코드
'''
sudo su -
yum update -y
yum install httpd -y
systemctl start httpd.service
systemctl status httpd.service
'''

#인스턴스별 웹페이지 설정
'''
cd /var/www/html/
echo "<html> Hello <img src=http://d111111abcdef8.cloudfront.net/images/image.jpg> </html>" > index.html
'''

#로드밸런서 접속법
'''
위 인스턴스별로 웹페이지 출력을 다르게해서
AWS - 인스턴스 - 로드밸런서 - DNS 정보 복사 및 웹 붙여넣기 - F5 눌러서 확인
'''
