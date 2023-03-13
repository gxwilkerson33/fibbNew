
resource "kubernetes_deployment" "redis_deployment" {
  metadata {
    name = "redis"
    labels = {
      component = "redis"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        component = "redis"
      }
    }
  

    template {
      metadata {
        labels = {
          component = "redis"
        }
      }
      spec {
        container {
          image = "redis"
          name  = "redis"
          port {
            container_port = 6379
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
