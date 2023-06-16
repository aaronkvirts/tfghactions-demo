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

/*
module "ecs" {
  source             = "resource-modules/ecs"
  ecs_rg_id          = "rg-aek4rvnkip7bedq"
  ecs_disk_name      = "Demo Test Disk"
  ecs_instance_name  = "Demo Test ECS Instance"
  ecs_vswitch_id     = "vsw-8psjrm8g2zfrhlkhmy0sm"
  ecs_security_group = "sg-8ps6mar1u7lwnb7kyr5i"
  ecs_disk_size      = 40
}
*/

resource "alicloud_instance" "ecs_instance_nano" {
  resource_group_id    = var.ecs_rg_id
  security_groups      = var.ecs_security_group
  instance_type        = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name     = var.ecs_disk_name
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = var.ecs_instance_name
  vswitch_id           = var.ecs_vswitch_id
  system_disk_size     = var.ecs_disk_size
}