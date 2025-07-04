output "gke_cluster_name" {
  value       = google_container_cluster.${{ values.component_id }}.name
  description = "GKE Cluster Name"
}

output "gke_cluster_endpoint" {
  value       = google_container_cluster.${{ values.component_id }}.endpoint
  description = "GKE Cluster Endpoint"
}
