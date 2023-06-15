variable "ALICLOUD_ACCESS_KEY" {}
variable "ALICLOUD_SECRET_KEY" {}

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
  access_key = var.ALICLOUD_ACCESS_KEY
  secret_key = var.ALICLOUD_SECRET_KEY
  region     = "ap-southeast-3"
}

module "ecs" {
  source             = "../modules/ecs"
  ecs_rg_id          = "rg-aek4rvnkip7bedq"
  ecs_disk_name      = "Demo Test Disk"
  ecs_instance_name  = "Demo Test ECS Instance"
  ecs_vswitch_id     = "vsw-8psjrm8g2zfrhlkhmy0sm"
  ecs_security_group = "sg-8ps6mar1u7lwnb7kyr5i"
  ecs_disk_size      = 40
}