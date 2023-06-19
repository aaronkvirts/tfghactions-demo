terraform {
  cloud {
    organization = "virtuosity"

    workspaces {
      name = "monday-demo"
    }
  }

  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.205.0"
    }
  }
}

provider "alicloud" {
  region     = "ap-southeast-3"
}

resource "alicloud_instance" "ecs_instance_1" {
  resource_group_id    = var.ecs_rg_id
  security_groups      = var.ecs_security_group
  instance_type        = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name     = "ECS-Disk-1"
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = "ECS-Instance-1"
  vswitch_id           = var.ecs_vswitch_id
  system_disk_size     = var.ecs_disk_size
}

resource "alicloud_instance" "ecs_instance_2" {
  resource_group_id    = var.ecs_rg_id
  security_groups      = var.ecs_security_group
  instance_type        = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name     = "ECS-Disk-2"
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = "ECS-Instance-2"
  vswitch_id           = var.ecs_vswitch_id
  system_disk_size     = var.ecs_disk_size
}

resource "alicloud_instance" "ecs_instance_3" {
  resource_group_id    = var.ecs_rg_id
  security_groups      = var.ecs_security_group
  instance_type        = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name     = "ECS-Disk-3"
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = "ECS-Instance-3"
  vswitch_id           = var.ecs_vswitch_id
  system_disk_size     = var.ecs_disk_size
}

resource "alicloud_instance" "ecs_instance_4" {
  resource_group_id    = var.ecs_rg_id
  security_groups      = var.ecs_security_group
  instance_type        = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name     = "ECS-Disk-4"
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = "ECS-Instance-4"
  vswitch_id           = var.ecs_vswitch_id
  system_disk_size     = 40
}
