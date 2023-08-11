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
      version = "1.209.0"
    }
  }
}

provider "alicloud" {
  region     = "ap-southeast-3"
}

resource "alicloud_instance" "ecs_instance_1" {
  resource_group_id    = "rg-aek4rvnkip7bedq"
  security_groups      = [ "sg-8psis5n91cq4i6zcqlb3" ]
  instance_type        = "ecs.t5-lc2m2.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name     = "ECS-Disk-1"
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = "ECS-Instance-1"
  vswitch_id           = "vsw-8psjrm8g2zfrhlkhmy0sm"
  system_disk_size     = var.ecs_disk_size
}