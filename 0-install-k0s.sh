#!/bin/bash



if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


if [ -f /etc/lsb-release ]; then

fi

echo "download the k0s binaries"
curl -sSLf https://get.k0s.sh | sh
curl --output /usr/bin/kubectl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x /usr/bin/kubectl
chmod +x /usr/bin/k0s