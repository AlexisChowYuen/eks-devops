resource "kubernetes_job_v1" "irsa_demo" {
  depends_on = [
    aws_iam_role.irsa_iam_role,
    aws_iam_role_policy_attachment.irsa_iam_role_policy_attachment
  ]
  metadata {
    name = "irsa-demo"
  }
  spec {
    template {
      metadata {
        labels = {
          app = "irsa-demo"
        }
      }
      spec {
        service_account_name = kubernetes_service_account_v1.irsa_demo_sa.metadata.0.name
        container {
          name  = "irsa-demo"
          image = "amazon/aws-cli:latest"
          args  = ["s3", "ls"]
        }
        restart_policy = "Never"
      }
    }
  }
}
