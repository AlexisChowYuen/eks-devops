resource "kubernetes_service_v1" "app1_lb_service" {
  metadata {
    name = "app1-service"
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
