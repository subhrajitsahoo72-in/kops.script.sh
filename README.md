Launch Amazon Linux 2/ 2023 , t3.micro

Attach a IAM ROLE TE=EC2, Permisions = admin

vi .bashrc

export PATH=$PATH:/usr/local/bin/


source .bashrc

ssh-keygen

cp /root/.ssh/id_rsa.pub my-keypair.pub

chmod 777 my-keypair.pub

vi kops.sh
:wq!
export KOPS_STATE_STORE=s3://subhrajit-kops-testbkt7867.k8s.local
kops validate cluster --wait 10m

if you want some change then used suggestion (optional)
Suggestions:
 * list clusters with: kops get cluster
 * edit this cluster with: kops edit cluster subhrajit.k8s.local
 * edit your node instance group: kops edit ig --name=subhrajit.k8s.local nodes-ap-south-1a
 * edit your control-plane instance group: kops edit ig --name=subhrajit.k8s.local control-plane-ap-south-1a


if you want to delete :  kops delete cluster --name subhrajit.k8s.local --yes

----------------------------------------------------------------

if you want to new kops.sh then used this 

kops delete cluster \
  --name=subhrajit.k8s.local \
  --state=s3://subhrajit-kops-testbkt7867.k8s.local \
  --yes

  if it not work then used 
  export KOPS_STATE_STORE=s3://subhrajit-kops-testbkt7867.k8s.local 
  
  this and do once again 
  
  kops delete cluster \
  --name=subhrajit.k8s.local \
  --state=s3://subhrajit-kops-testbkt7867.k8s.local \
  --yes
  ---------------------------------------------------------------
