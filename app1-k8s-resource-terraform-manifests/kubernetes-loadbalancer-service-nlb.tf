resource "kubernetes_service_v1" "app1_nlb_service" {
  metadata {
    name = "app1-nlb-service"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.myapp1.spec.0.template.0.metadata.0.labels.app
    }
    port {
      name        = "http"
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
