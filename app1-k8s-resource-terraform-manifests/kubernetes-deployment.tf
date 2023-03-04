# Kuberneyes Deployment Manifest

resource "kubernetes_deployment_v1" "myapp1" {
  metadata {
    name = "myapp1-deployment"
    labels = {
      app1 = "myapp1"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "myapp1"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp1"
        }
      }

      spec {
        container {
          name  = "myapp1-container"
          image = "stacksimplify/kubenginx:1.0.0"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
