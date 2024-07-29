provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "kubernetes_namespace" "test-namespace" {
  metadata {
    name = "my-first-namespace"
  }
}