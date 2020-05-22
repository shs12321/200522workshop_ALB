resource "aws_default_security_group" "user10_r1_sg_default" {
    vpc_id = aws_vpc.user10_r1_vpc.id
    ingress {
        protocol = -1
        self = true
        from_port = 0
        to_port = 0
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "user10_r1_sg_default"
    }
}
# 리전1 시큐리티 그룹
resource "aws_security_group" "user10_r1_sg" {
    name = "user10_r1_sg"
    description = "open ssh port for r1_ins1"
    vpc_id = aws_vpc.user10_r1_vpc.id
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "user10_r1_sg"
    }
}
