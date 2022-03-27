FROM ubuntu:20.04

ENV  AWS_ACCESS_KEY \
	 AWS_SECRET_KEY

RUN  apt-get update && \
	 apt-get install wget curl unzip -y

# aws cli install
RUN  apt-get install python3 python3-pip -y && \
	 pip install awscli

# terraform install
RUN	 wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_arm64.zip && \
	 unzip terraform_1.1.7_linux_arm64.zip && \
	 rm terraform_1.1.7_linux_arm64.zip

RUN  mv terraform /usr/local/bin/

# kubectl install
RUN  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
	 install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# helm install
RUN  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
	 chmod 700 get_helm.sh && \
	 ./get_helm.sh

CMD ["terraform", "--version"]