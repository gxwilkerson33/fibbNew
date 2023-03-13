resource "kubernetes_service" "client_LoadBalancer" {
  metadata {
    name = "client-loadbalancer"
  }
  spec {
    selector = {
      component = "client"
    }
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "server_LoadBalancer" {
  metadata {
    name = "server-loadbalancer"
  }
  spec {
    selector = {
      component = "server"
    }
    port {
      port        = 5000
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "postgres_LoadBalancer" {
  metadata {
    name = "postgres-loadbalancer"
  }
  spec {
    selector = {
      component = "postgres"
    }
    port {
      port        = 5432
      target_port = 5432
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "redis_LoadBalancer" {
  metadata {
    name = "redis-loadbalancer"
  }
  spec {
    selector = {
      component = "redis"
    }
    port {
      port        = 6379
      target_port = 6379
    }

    type = "LoadBalancer"
  }
}