resource "ansible_group" "syslog_mgt_group" {
  name = "syslog_mgt"
  variables = {
    ansible_user                 = var.mesh_local_user
    ansible_ssh_private_key_file = "../terraform/logssh"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    DATADOG_API_KEY              = var.datadog_api_key
    DATADOG_SITE                 = var.datadog_site
    VM_HOSTNAME                  = var.hostname
    bird_router_id               = var.router_id
    VM_MGT_IP                    = var.vm_mgt_ip
    INTERNAL_HOST_IDENTIFIER     = var.internal_host_identifier
    bird_network                 = var.bird_network
    SYSLOG_IP                    = var.syslog_ip
    DEFAULT_GATEWAY              = var.vm_mgt_default_gateway
    local_password               = var.local_password
  }
}

resource "ansible_host" "syslog_mgt" {
  name   = var.vm_mgt_ip
  groups = [ansible_group.syslog_mgt_group.name]
}
