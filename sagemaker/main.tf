resource "aws_sagemaker_notebook_instance" "uat_sm" {
  name                    = var.sm_name
  role_arn                = aws_iam_role.notebook_iam_role.arn
  instance_type           = var.instance_type

  tags = {
    Name = var.sm_name
  }
}

resource "aws_iam_policy_attachment" "sm_full_access_attach" {
  name = "${var.sm_name}-policy"
  roles = [aws_iam_role.notebook_iam_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}

resource "aws_iam_role" "notebook_iam_role" {
  name = "${var.sm_name}-role"
  path = "/"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "sagemaker.amazonaws.com"
          },
          "Effect" : "Allow"
        }
      ]
    }
  )
}
