output "cloudflare_tunnel_token" {
    value = cloudflare_tunnel.k8s-tunnel.tunnel_token
    sensitive = true
}