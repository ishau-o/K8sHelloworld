sudo apt-get update
apt install unzip python
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
aws configure
ssh-keygen
kops create cluster --cloud=aws --zones=us-east-2a --name=demo.k8s.helloworld.com --dns-zone=helloworld.com --dns private 
export KOPS_STATE_STORE=s3://demo.k8s.valaxy.net
export KOPS_STATE_STORE=s3://demo.k8s.helloworld.com
ssh-keygen
kops create cluster --cloud=aws --zones=us-east-2a --name=demo.k8s.helloworld.com --dns-zone=helloworld.com --dns private 
kops update cluster demo.k8s.helloworld.com --yes
kops validate cluster
kubectl version
kops validate cluster
kubectl get nodes
lookup api.demo.k8s.helloworld.com
apt install lookup
lookup api.demo.k8s.helloworld.com
kops validate cluster
kubectl get nodes
ls -al
docker ps
apt install docker.io
vi Deployment.yaml
ls -al
kubectl apply -f Deployment.yaml
kubectl get svc
