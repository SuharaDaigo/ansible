# MariaDB

[MariaDB](https://mariadb.org/)をインストールします。

また、`mysql_secure_installation`に相当する処理を実行します。

## Requirements

サポート OS

- Debian
- Ubuntu
- AlmaLinux
- Amazon Linux 2023
- EL

## Role Variables

| ファイル名                      | 説明                   |
| ------------------------------- | ---------------------- |
| [main.yml](./defaults/main.yml) | mariadb-server の conf |

## Dependencies

None

## Example Playbook

```yml
- name: Install mariadb
  hosts: db
  roles:
    - mariadb
  vars:
    mariadb_root_password: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      62313365396662343061393464336163383764373764613633653634306231386433626436623361
      6134333665353966363534333632666535333761666131620a663537646436643839616531643561
      63396265333966386166373632626539326166353965363262633030333630313338646335303630
      3438626666666137650a353638643435666633633964366338633066623234616432373231333331
      6564
```

## License

MIT

## Author Information

https://github.com/CASL0
