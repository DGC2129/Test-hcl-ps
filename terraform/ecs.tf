# Create ECS Cluster
resource "aws_ecs_cluster" "ECS-Cluster" {
  name = local.cluster_name

  tags = {
    Name = local.cluster_name
  }
}

# Create IAM Role for ECS Task Execution
# resource "aws_iam_role" "ecs_task_execution_role" {
#   name = "ecsTaskExecutionRole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect    = "Allow",
#       Principal = { Service = "ecs-tasks.amazonaws.com" },
#       Action    = "sts:AssumeRole"
#     }]
#   })
# }

# # Attach IAM Policy to ECS Role
# resource "aws_iam_role_policy_attachment" "ecs_task_execution_attach" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }

# Create ALB Security Group
# resource "aws_security_group" "alb_sg" {
#   name        = "alb-security-group"
#   description = "Allow inbound HTTP and HTTPS traffic to ALB"
#   vpc_id      = aws_vpc.default.id

#   # Allow HTTP traffic from anywhere
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # Allow HTTPS traffic from anywhere
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # Allow all outbound traffic
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# Create Application Load Balancer (ALB)
# resource "aws_lb" "alb" {
#   name               = "ecs-hcl-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_sg.id]
#   subnets            = aws_subnet.public-subnets[*].id
# }

# Create Target Group for ALB
# resource "aws_lb_target_group" "ecs_tg" {
#   name        = "ecs-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.default.id
#   target_type = "ip"
# }