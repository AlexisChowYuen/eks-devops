resource "kubernetes_service_v1" "app1_np_service" {
  metadata {
    name = "app1-nodeport-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.myapp1.spec.0.template.0.metadata.0.labels.app
    }
    port {
      name        = "http"
      port        = 80
      target_port = 80
      node_port = 31280
    }

    type = "NodePort"
  }
}
