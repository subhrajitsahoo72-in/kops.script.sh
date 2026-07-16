curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.32.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops
aws s3api create-bucket --bucket subhrajit-kops-testbkt7867.k8s.local --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
aws s3api put-bucket-versioning --bucket subhrajit-kops-testbkt7867.k8s.local --region ap-south-1 --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://subhrajit-kops-testbkt7867.k8s.local
kops create cluster --name=subhrajit.k8s.local --zones=ap-south-1a,ap-south-1b --control-plane-count=1 --control-plane-size=m7i-flex.large --node-count=2 --node-size=m7i-flex.large --node-volume-size=40 --control-plane-volume-size=40 --ssh-public-key=my-keypair.pub --image=ami-0f918f7e67a3323f0 --networking=calico --topology=public
kops update cluster --name subhrajit.k8s.local --yes --admin
