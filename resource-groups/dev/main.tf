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
  instance_type        = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name     = "ECS-Disk-1"
  image_id             = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name        = "ECS-Instance-1"
  vswitch_id           = "vsw-8psjrm8g2zfrhlkhmy0sm"
  system_disk_size     = var.ecs_disk_size
}

/**
resource "alicloud_kvstore_instance" "redis_dual_instance_1" {
  db_instance_name = "Redis-Dual-Instance-1"
  vswitch_id       = "vsw-8psjrm8g2zfrhlkhmy0sm"
  resource_group_id = "rg-aek4rvnkip7bedq"
  security_ips = [
    "172.16.0.0/16"
  ]
  instance_type  = "Redis"
  engine_version = "5.0"
  #config = {
  #  appendonly             = "yes",
  #  lazyfree-lazy-eviction = "yes",
  #}
  #tags = {
  #  Created = "TF",
  #  For     = "Test",
  #}
  zone_id           = "ap-southeast-3a"
  secondary_zone_id = "ap-southeast-3b"
  instance_class    = "redis.master.small.default"
  payment_type      = "PostPaid"
}
**/

/**
resource "alicloud_db_instance" "rds_ha_instance_1" {
  category                 = "HighAvailability"
  engine                   = "PostgreSQL"
  engine_version           = "14.0"
  instance_charge_type     = "Postpaid"
  instance_name            = "RDS_HA_Instance_1"
  instance_type            = "pg.x2.medium.2c"
  db_instance_storage_type = "cloud_essd"
  instance_storage         = 20
  security_ips = [
    "172.16.0.0/16"
  ]
  vpc_id          = "vpc-8psaljegjue2xsaao7ycg"
  vswitch_id      = "vsw-8psjrm8g2zfrhlkhmy0sm"
  zone_id         = "ap-southeast-3a"
  zone_id_slave_a = "ap-southeast-3b"
  #monitoring_period = 5
}
**/

/**
resource "alicloud_cs_managed_kubernetes" "ack_pro_cluster_instance_1" {
  name              = "ACK_Pro_cluster_instance_1"
  cluster_spec      = "ack.pro.small"
  version           = "1.24.6-aliyun.1"
  resource_group_id = "rg-aek4rvnkip7bedq"

  worker_vswitch_ids = [
    "vsw-8psjrm8g2zfrhlkhmy0sm"
  ]

  pod_vswitch_ids = [
    "vsw-8psjrm8g2zfrhlkhmy0sm"
  ]

  new_nat_gateway      = true
  slb_internet_enabled = false
  load_balancer_spec   = "slb.s1.small"
  service_cidr         = "172.16.0.0/16"
  pod_cidr             = "10.55.0.0/16"
  proxy_mode           = "ipvs"
  # Enable Ram Role for ServiceAccount
  enable_rrsa = true

  deletion_protection = false
  # unit:day
  //control_plane_log_ttl        = 30
  //control_plane_log_components = ["apiserver", "kcm", "scheduler"]
  # The components. 
  dynamic "addons" {
    for_each = var.cluster_addons
    content {
      name   = lookup(addons.value, "name", var.cluster_addons)
      config = lookup(addons.value, "config", var.cluster_addons)
    }
  }
}
**/

/**
resource "alicloud_cs_kubernetes_node_pool" "managed_nodepool_ack_instance_1" {
  name       = "Managed_nodepool_ACK_instance_1"
  cluster_id = alicloud_cs_managed_kubernetes.ack_pro_cluster_instance_1.id

  vswitch_ids = [
    "vsw-8psjrm8g2zfrhlkhmy0sm"
  ]

  /**
  scaling_config {
    min_size = 3
    max_size = 5
  }

  desired_size = 3

  management {
    max_unavailable = 1
    auto_repair     = true
    auto_upgrade    = false
  }

  runtime_name    = "containerd"
  runtime_version = "1.6.20"

  instance_types       = ["ecs.c6.xlarge"]
  instance_charge_type = "PostPaid"

  password = "Virtua/4u"

  install_cloud_monitor = true

  image_id             = "aliyun_2_1903_x64_20G_alibase_20230308.vhd"
  //image_id             = "aliyun_3_x64_20G_alibase_20230629.vhd"
  system_disk_category = "cloud_efficiency"
  system_disk_size     = 40

  /**
  data_disks {
    category = "cloud_efficiency"
    size     = 20
  }
}
**/

/**
resource "alicloud_cs_autoscaling_config" "ack_instance_1_autoscaling" {
  cluster_id = alicloud_cs_managed_kubernetes.ack_pro_cluster.id
  // configure auto scaling
  cool_down_duration        = "10m"
  unneeded_duration         = "10m"
  utilization_threshold     = "0.5"
  gpu_utilization_threshold = "0.5"
  scan_interval             = "60s"
  scale_down_enabled        = true
  expander                  = "least-waste"
}
**/