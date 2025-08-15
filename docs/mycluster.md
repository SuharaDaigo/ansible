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