output "ecs_instance_1_id" {
  value       = alicloud_instance.ecs_instance_1.id
  description = "ID for the deployed alicloud ECS instance"
}

output "redis_dual_instance_1_id" {
  value       = alicloud_kvstore_instance.redis_dual_instance_1.id
  description = "ID for the deployed alicloud Redis instance"
}

output "rds_ha_instance_1_id" {
  value       = alicloud_db_instance.rds_ha_instance_1.id
  description = "ID for the deployed alicloud RDS instance"
}

output "ack_pro_cluster_instance_1_id" {
  value       = alicloud_cs_managed_kubernetes.ack_pro_cluster_instance_1.id
  description = "ID for the deployed alicloud ACK Pro instance"
}