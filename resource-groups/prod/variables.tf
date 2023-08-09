variable "security_group" {
    type = list(string)
    default = [ "sg-8psis5n91cq4i6zcqlb3" ]
    description = "Security Group ID"
}

variable "ecs_disk_size" {
    type = number
    default = 80
    description = "ECS Disk Size"
}

variable "vswitch_id" {
    type = string
    default = "vsw-8psjrm8g2zfrhlkhmy0sm"
    description = "vSwitch ID"
}

variable "rg_id" {
    type = string
    default = "rg-aek4rvnkip7bedq"
    description = "Resource Group ID"
}

variable "cluster_addons" {
  type = list(object({
    name   = string
    config = string
  }))

  default = [
    # CNI: Terway
    {
      "name" : "terway-eniip",
      "config" : "{\"IPVlan\":\"true\",\"NetworkPolicy\":\"true\",\"ENITrunking\":\"false\"}"
    },
    # CSI
    {
      "name"   = "csi-plugin",
      "config" = ""
    },
    {
      "name"   = "csi-provisioner",
      "config" = ""
    },
    {
      "name" : "logtail-ds",
      "config" : "{\"IngressDashboardEnabled\":\"true\"}"
    },
    {
      "name" : "ack-node-problem-detector",
      "config" : "{\"sls_project_name\":\"\"}"
    },
    # Ingress Controller
    {
      "name"   = "nginx-ingress-controller",
      "config" = "{\"IngressSlbNetworkType\":\"internet\",\"IngressSlbSpec\":\"slb.s2.small\"}"
    },
    {
      "name" : "ack-node-local-dns",
      "config" = ""
    },
    {
      "name" : "arms-prometheus",
      "config" = ""
    }
  ]
}