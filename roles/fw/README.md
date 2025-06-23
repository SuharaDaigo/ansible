# FW

Firewall をインストールします。

Debian 系：`ufw`

## Requirements

サポート OS

- Debian
- Ubuntu

## Role Variables

| ファイル名                      | 説明             |
| ------------------------------- | ---------------- |
| [main.yml](./defaults/main.yml) | firewall の rule |

## Dependencies

None

## Example Playbook

```yaml
- name: Install firewall
  hosts: localhost
  roles:
    - fw
  vars:
    fw_rules:
      - rule: allow
        proto: tcp
        port: "22"
```

## License

MIT

## Author Information

https://github.com/CASL0
