# Squid

[Squid](https://www.squid-cache.org/)をインストールします。

## Requirements

サポート OS

- Debian
- Ubuntu
- AlmaLinux
- Amazon Linux 2023
- EL

## Role Variables

| ファイル名                      | 説明       |
| ------------------------------- | ---------- |
| [main.yml](./defaults/main.yml) | squid.conf |

## Dependencies

None

## Example Playbook

```yml
- name: Install squid
  hosts: localhost
  roles:
    - squid
  vars:
    squid_allowlist:
      - .github.com
      - .ansible.com
```

## License

MIT

## Author Information

https://github.com/CASL0
