output "alicloud_ecs_instance_id" {
  value       = alicloud_instance.ecs_instance_dev_1.id
  description = "ECS Instance ID"
}

output "alicloud_vpc_id" {
  value       = alicloud_vpc.vpc_prod.id
  description = "VPC ID"
}

output "alicloud_vswitch_id" {
  value       = alicloud_vswitch.vswitch_prod.id
  description = "vSwitch ID"
}
