#init kube master with calico network interface
kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#generate join token
kubeadm token create --print-join-command > /joincluster.sh

# install calio network
kubectl create -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-
