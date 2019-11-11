# K8sHelloworld
    Create Ubuntu EC2 instance

    install AWSCLI
    curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
     apt install unzip python
     unzip awscli-bundle.zip
     ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

    Install kubectl on ubuntu instance

    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
     chmod +x ./kubectl
     sudo mv ./kubectl /usr/local/bin/kubectl

    Install kops on ubuntu instance

     curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
     chmod +x kops-linux-amd64
     sudo mv kops-linux-amd64 /usr/local/bin/kops

    Create an IAM user/role with Route53, EC2, IAM and S3 full access

    Attach IAM role to ubuntu instance

    Create a Route53 private hosted zone (you can create Public hosted zone if you have a domain)

    Routeh53 --> hosted zones --> created hosted zone  
    Domain Name: helloworld.com
    Type: Private hosted zone for Amzon VPC

    create an S3 bucket

     aws s3 mb s3://demo.k8s.helloworld.com

    Expose environment variable:

     export KOPS_STATE_STORE=s3://demo.k8s.helloworld.com

    Create sshkeys before creating cluster

     ssh-keygen

    Create kubernetes cluster definitions on S3 bucket

    kops create cluster --cloud=aws --zones=us-east-2 --name=demo.k8s.helloworld.com --dns-zone=helloworld.com --dns private 

    Create kubernetes cluser

    kops update cluster demo.k8s.helloworld.com --yes

    Validate your cluster

     kops validate cluster

    To list nodes

    kubectl get nodes

    To delete cluster

     kops delete cluster demo.k8s.helloworld.com --yes

