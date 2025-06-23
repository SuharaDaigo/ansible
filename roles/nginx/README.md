# NGINX

[NGINX](https://nginx.org/en/)をインストールします。

インストールには NGINX の公式ロール（[nginxinc.nginx](https://github.com/nginxinc/ansible-role-nginx)）を使用します。

## Requirements

サポート OS

- Debian
- Ubuntu
- AlmaLinux
- Amazon Linux 2023
- EL

## Role Variables

| ファイル名                      | 説明          |
| ------------------------------- | ------------- |
| [main.yml](./defaults/main.yml) | nginx の conf |

## Dependencies

- nginxinc.nginx

## Example Playbook

```yml
- name: Install nginx
  hosts: web
  roles:
    - nginx
```

## License

MIT

## Author Information

https://github.com/CASL0
