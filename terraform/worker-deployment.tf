
resource "kubernetes_deployment" "worker-deployemnt" {
  metadata {
    name = "worker-deployemnt"
    labels = {
      component = "worker"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        component = "worker"
      }
    }

    template {
      metadata {
        labels = {
          component = "worker"
        }
      }

      spec {
        container {
          image = "gxwilkerson33/multi-worker"
          name  = "worker"
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

