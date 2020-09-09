install:
	# This should be run from inside a virtualenv
	npm install
		
install-hadolint:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64
	chmod +x /bin/hadolint

install-minikube:
	wget -O /bin/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	chmod +x /bin/minikube

install-kubernetes:
	curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
	chmod +x ./kubectl
	mv ./kubectl /usr/local/bin/kubectl

install-nodejs:
	curl -sL https://deb.nodesource.com/setup_12.x | bash -
	apt-get install -y nodejs

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	hadolint Dockerfile 


all: install lint test