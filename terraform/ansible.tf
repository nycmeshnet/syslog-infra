resource "ansible_group" "syslog_mgt_group" {
  name = "syslog_mgt"
  variables = {
    ansible_user                 = var.mesh_local_user
    ansible_ssh_private_key_file = "../terraform/logssh"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    DATADOG_API_KEY              = var.datadog_api_key
    DATADOG_SITE                 = var.datadog_site
    VM_HOSTNAME                  = var.hostname
  }
}

resource "ansible_host" "syslog_mgt" {
  name   = var.vm_mgt_ip
  groups = [ansible_group.monitor_mgt_group.name]
}
