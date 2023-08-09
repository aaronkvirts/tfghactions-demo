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
