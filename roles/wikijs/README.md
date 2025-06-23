# Wiki.js

[Wiki.js](https://js.wiki/)をインストールします。

データベースは mariadb を使用します。

## Requirements

サポート OS

- Debian
- Ubuntu
- AlmaLinux
- Amazon Linux 2023
- EL

## Role Variables

| ファイル名                      | 説明           |
| ------------------------------- | -------------- |
| [main.yml](./defaults/main.yml) | wikijs の conf |

## Dependencies

- nodejs
- mariadb

## Example Playbook

```yml
- name: Install wikijs
  hosts: wikijs
  roles:
    - wikijs
  vars:
    mariadb_root_password: root
    wikijs_db_user: wikijs
    wikijs_db_password: wikijs
    wikijs_db_name: wikijs
```

## License

MIT

## Author Information

https://github.com/CASL0
