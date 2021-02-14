mkdir -p ${HOME}/.k0s
sudo echo "starting k0s..."
k0s default-config | tee ${HOME}/.k0s/k0s.yaml
sudo nohup k0s server -c ${HOME}/.k0s/k0s.yaml --enable-worker &

sudo cat /var/lib/k0s/pki/admin.conf | tee ~/.k0s/kubeconfig
export KUBECONFIG="${HOME}/.k0s/kubeconfig"
echo "Kubeconfig is located in ${HOME}/.k0s/kubeconfig"

LINE='export KUBECONFIG=$KUBECONFIG:${HOME}/.k0s/kubeconfig'
FILE=${HOME}/.bashrc
grep -qF "$LINE" "$FILE"  || echo "$LINE" | sudo tee --append "$FILE"