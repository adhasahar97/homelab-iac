resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_tunnel" "k8s-tunnel" {
  account_id = data.cloudflare_user.me.id
  name       = "k8s-tunnel"
  secret     = base64sha256(random_password.tunnel_secret.result)
}
resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

# resource "helm_release" "ingress-nginx" {
#   depends_on = [module.eks_blueprints_kubernetes_addons]

#   name       = "prometheus-community"
#   chart      = "kube-prometheus-stack"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   namespace  = kubernetes_namespace.ingress-nginx.id

#   # values = [
#   #   "${templatefile("prometheus_stack_helm/values.yaml", {
#   #       url = "grafana.${var.argo_cd["subdomain"]}.${data.aws_route53_zone.argocd_selected_host.name}"
#   #   })}"
#   # ]
# }
