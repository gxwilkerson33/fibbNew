
resource "kubernetes_deployment" "server_deployment" {
  metadata {
    name = "server-deployemnt"
    labels = {
      component = "server"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        component = "server"
      }
    }

    template {
      metadata {
        labels = {
          component = "server"
        }
      }

      spec {
        container {
          image = "gxwilkerson33/multi-server"
          name  = "server"
          port {
            container_port = 5000
          }
          env {
            name  = "REDIS_HOST"
            value = kubernetes_service.redis_LoadBalancer.id
          }
          env {
            name  = "REDIS_PORT"
            value = 6379
          }
          env {
            name  = "PGHOST"
            value = kubernetes_service.postgres_LoadBalancer.id
          }
          env {
            name  = "PGPORT"
            value = 5432
          }
          env {
            name  = "PGUSER"
            value = "postgres"
          }
          env {
            name  = "PGDATABASE"
            value = "postgres"
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = "password"
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
