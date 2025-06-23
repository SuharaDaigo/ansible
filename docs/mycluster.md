# mycluster

[kubespray](https://github.com/kubernetes-sigs/kubespray) を使用して、おうち kubernetes クラスターを構築する。

<img src="https://raw.githubusercontent.com/CASL0/ansible/images/mycluster.jpeg" width="40%" />

## 構築

```sh
ansible-playbook playbooks/mycluster.yml --become
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

## 物理

| 名前                                                                                   | 単価      | 個数 | 備考                      |
| -------------------------------------------------------------------------------------- | --------- | ---- | ------------------------- |
| [Raspberry Pi 4 Model B 8GB](https://raspberry-pi.ksyic.com/?pdp.id=552)               | 16,800 円 | 3    |                           |
| [アクリルケース付き PoE HAT](https://www.amazon.co.jp/dp/B097NCD6FW)                   | 3,599 円  | 3    |                           |
| [TP-Link TL-SG105PE](https://www.amazon.co.jp/dp/B08GDC61NS)                           | 6,667 円  | 1    | PoE 給電用                |
| [microSD カード 64GB](https://www.amazon.co.jp/dp/B07DVJ86SS)                          | 980 円    | 3    |                           |
| [HDMI (メス) - micro HDMI (オス) 変換アダプタ](https://www.amazon.co.jp/dp/B01017VGR2) | 970 円    | 1    | OS の初期化・ssh の設定用 |
