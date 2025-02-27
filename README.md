# syslog-infra

## Ports

| Port        | Protocol           | Device Type |
| ------------- | ------------- | ------------- |
| 514 | UDP | Mikrotik Router OS + Siklu (opt in static IPs) |
| 515 | UDP | APC UPS |
| 516 | UDP | Ubiquiti airOS |
| 517 | UDP | Brocade |
| 518 | UDP | iLO |
| 519 | UDP | iDRAC |
| 520 | UDP | Netgear |

## Add a new port

1. Add a new file under [ansible/roles/log_collector/files/](./ansible/roles/log_collector/files/)
2. Add the port + ruleset mapping to [ansible/roles/log_collector/files/rsyslog.conf](./ansible/roles/log_collector/files/rsyslog.conf)
3. Add the 3 mappings in [ansible/roles/log_collector/tasks/main.yaml](./ansible/roles/log_collector/tasks/main.yaml) for DD ingestion, file creation, and config file transfer.
4. Update the table in this file.
