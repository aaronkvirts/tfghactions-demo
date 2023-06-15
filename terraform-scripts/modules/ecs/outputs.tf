output "ecs_instance_id" {
  value       = alicloud_instance.ecs_instance_nano.id
  description = "ID for the deployed alicloud ECS instance"
}