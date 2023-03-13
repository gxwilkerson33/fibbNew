
resource "kubernetes_deployment" "client-deployemnt" {
  metadata {
    name = "client-deployemnt"
    labels = {
      component = "client"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        component = "client"
      }
    }

    template {
      metadata {
        labels = {
          component = "client"
        }
      }

      spec {
        container {
          image = "gxwilkerson33/multi-client"
          name  = "client"
          port {
            container_port = 3000
          }
          env {
            name  = "REDIS_HOST"
            value = kubernetes_service.redis_LoadBalancer.id
          }
          env {
            name  = "REDIS_PORT"
            value = 6379
          }
          resources {
            limits = {
              cpu    = "3.0"
              memory = "512Mi"
            }
            requests = {
              cpu    = "750m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

