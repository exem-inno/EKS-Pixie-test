#!/bin/zsh
docker run -it --rm \
		--name terraform \
		-e AWS_ACCESS_KEY=$AWS_ACCESS_KEY \
		-e AWS_SECRET_KEY=$AWS_SECRET_KEY \
		-v `pwd`/eks-getting-started:/root/eks-getting-started \
		terraform bash
