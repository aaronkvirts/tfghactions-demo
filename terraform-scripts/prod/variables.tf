variable "ecs_security_group" {
    type = list(string)
    default = [ "sg-8psis5n91cq4i6zcqlb3" ]
    description = "Security Group ID"
}

variable "ecs_disk_name" {
    type = string
    default = "Demo-Test-Disk"
    description = "ECS Disk Name"
}

variable "ecs_disk_size" {
    type = number
    default = 100
    description = "ECS Disk Size"
}

variable "ecs_instance_name" {
    type = string
    default = "Demo-Test-ECS-Instance"
    description = "ECS Instance Name"
}

variable "ecs_vswitch_id" {
    type = string
    default = "vsw-8psjrm8g2zfrhlkhmy0sm"
    description = "vSwitch ID"
}

variable "ecs_rg_id" {
    type = string
    default = "rg-aek4rvnkip7bedq"
    description = "Resource Group ID"
}
