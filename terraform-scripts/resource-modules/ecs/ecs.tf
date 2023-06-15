resource "alicloud_instance" "ecs_instance_nano" {
  security_groups      = var.ecs_security_group //[ "sg-8ps2di45ns5shx56ro6a" ]
  instance_type        = "ecs.t5-lc2m1.nano"
  resource_group_id    = var.ecs_rg_id
  system_disk_category = "cloud_efficiency"
  system_disk_name     = var.ecs_disk_name //"Aaron-test-disk"
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = var.ecs_instance_name //"Aaron-test"
  vswitch_id           = var.ecs_vswitch_id    //"vsw-8psle91nr385rpxgyqi8p"
  system_disk_size     = var.ecs_disk_size
}