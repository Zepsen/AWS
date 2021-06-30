resource "aws_launch_configuration" "my_launch_configuration" {

  # Amazon Linux 2 AMI (HVM), SSD Volume Type (ami-0f02b24005e4aec36).
  image_id = var.ami

  instance_type   = "t2.micro"
  key_name        = aws_key_pair.ssh.key_name
  security_groups = var.security_groups

  # set to false on prod stage.
  # otherwise true, because ssh access might be needed to the instance.
  associate_public_ip_address = true
  lifecycle {
    # ensure the new instance is only created before the other one is destroyed.
    create_before_destroy = true
  }

  # execute bash scripts inside deployment.sh on instance's bootstrap.
  # what the bash scripts going to do in summary:
  # fetch a hello world app from Github repo, then deploy it in the instance.
  user_data = file("./cloudinit/init_copy.sh")
}

resource "aws_key_pair" "ssh" {
  key_name   = var.ssh_key
  public_key = file("./ssh-keys/${var.ssh_key}.pub")
}

resource "aws_autoscaling_group" "my_autoscaling_group" {
  name              = "my-autoscaling-group"
  desired_capacity  = 2 # ideal number of instance alive
  min_size          = 2 # min number of instance alive
  max_size          = 5 # max number of instance alive
  health_check_type = "ELB"

  # allows deleting the autoscaling group without waiting
  # for all instances in the pool to terminate
  force_delete = true

  launch_configuration = aws_launch_configuration.my_launch_configuration.id
  vpc_zone_identifier = [
    "subnet-6e122808",
    "subnet-6251442a"
  ]
  timeouts {
    delete = "15m" # timeout duration for instances
  }
  lifecycle {
    # ensure the new instance is only created before the other one is destroyed.
    create_before_destroy = true
  }
}

# create an alb listener for my_alb.
# forward rule: only accept incoming HTTP request on port 80,
# then it'll be forwarded to port target:8080.
resource "aws_lb_listener" "my_alb_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.my_alb_target_group.arn
    type             = "forward"
  }
}

# my_alb will forward the request to a particular app,
# that listen on 8080 within instances on my_vpc.
resource "aws_lb_target_group" "my_alb_target_group" {
  port     = 8080
  protocol = "HTTP"
  vpc_id = "vpc-7b23ea02"
}

# create an Application Load Balancer.
# attach the previous availability zones' subnets into this load balancer.
resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false         # set lb for public access
  load_balancer_type = "application" # use Application Load Balancer
  security_groups    = [aws_security_group.my_alb_security_group.id]
  subnets = [ # attach the availability zones' subnets.
    "subnet-6e122808",
    "subnet-6251442a"
  ]
}

resource "aws_security_group" "my_alb_security_group" {
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_autoscaling_attachment" "my_aws_autoscaling_attachment" {
    alb_target_group_arn = aws_lb_target_group.my_alb_target_group.arn
    autoscaling_group_name = aws_autoscaling_group.my_autoscaling_group.id
}