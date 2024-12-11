resource "proxmox_lxc" "monitoring_host" {
  target_node  = var.proxmox_node
  hostname     = var.hostname
  description  = "Monitoring host managed IaC via https://github.com/nycmesh/syslog-infra"
  ostemplate   = var.system_image
  password     = var.local_password
  cores        = 2
  memory       = 1024
  unprivileged = true
  start        = true
  onboot       = true

  ssh_public_keys = file("${path.root}/logssh.pub")

  rootfs {
    storage = var.proxmox_storage_location
    size    = "50G"
  }

  network {
    name   = "eth0"
    bridge = var.vm_nic
    ip     = "${var.vm_mgt_ip}/${var.internal_host_identifier}"
    gw     = var.vm_mgt_default_gateway
  }

  tags = "syslog,managed_by_iac"
}
