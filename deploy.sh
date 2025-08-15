sudo apt update
sudo chmod 666 ~/.ssh/id_ed25519
sudo apt install python3.12-venv
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/mycluster.yml -b -K
mkdir ~/.kube
cp -ip inventory/artifacts/admin.conf ~/.kube/config
sudo chmod 600 ~/.kube/config