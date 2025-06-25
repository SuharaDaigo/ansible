# mycluster

[kubespray](https://github.com/kubernetes-sigs/kubespray) を使用して、おうち kubernetes クラスターを構築する。

<img src="https://raw.githubusercontent.com/CASL0/ansible/images/mycluster.jpeg" width="40%" />

## 構築

```sh
sudo apt update
sudo apt install python3.12-venv ansible
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/mycluster.yml -b
mkdir ~/.kube
cp -ip inventories/artifacts/admin.conf ~/.kube/config
sudo chmod 600 ~/.kube/config
```

## Kubernetes API を叩く

構築後に Ansible の Control node 上に kubeconfig（`admin.conf`） と `kubectl` がダウンロードされる。

これらを使用し Kubernetes API に接続できる。

```sh
cd inventories/artifacts
./kubectl.sh get nodes
```

## 構成

<img src="https://raw.githubusercontent.com/CASL0/ansible/images/k8s.svg" />

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
