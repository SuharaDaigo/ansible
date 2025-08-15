# mycluster

[kubespray](https://github.com/kubernetes-sigs/kubespray) を使用して、おうち kubernetes クラスターを構築する。

## 構築

```sh
bash deploy.sh
```

## 破壊
```sh
source venv/bin/activate && ansible-playbook kubernetes_sigs.kubespray.reset -b -K
```

## Firewall

### Control plane

| 項番 | プロトコル | ポート    | 説明                    |
| ---- | ---------- | --------- | ----------------------- |
| 1    | TCP        | 22        | SSH                     |
| 2    | TCP        | 6443      | Kubernetes API server   |
| 3    | TCP        | 2379-2380 | etcd server client API  |
| 4    | TCP        | 10250     | Kubelet API             |
| 5    | TCP        | 10259     | kube-scheduler          |
| 6    | TCP        | 10257     | kube-controller-manager |
| 7    | UDP        | 8285      | flannel udp backend     |
| 8    | UDP        | 8472      | flannel vxlan backend   |

### Worker node

| 項番 | プロトコル | ポート      | 説明                  |
| ---- | ---------- | ----------- | --------------------- |
| 1    | TCP        | 22          | SSH                   |
| 2    | TCP        | 10250       | Kubelet API           |
| 3    | TCP        | 10256       | kube-proxy            |
| 4    | TCP        | 30000-32767 | NodePort Services     |
| 5    | UDP        | 8285        | flannel udp backend   |
| 6    | UDP        | 8472        | flannel vxlan backend |
| 7    | TCP        | 80          | http                  |
| 8    | TCP        | 443         | https                 |
