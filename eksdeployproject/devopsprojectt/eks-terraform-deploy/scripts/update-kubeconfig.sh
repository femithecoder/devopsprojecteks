#!/bin/bash
response="$(aws eks list-clusters --region eu-west-2 --output text | grep -i eks-cluster 2>&1)" 
if [[ $? -eq 0 ]]; then
    echo "Success: eks-cluster exist"
    aws eks --region eu-west-2 update-kubeconfig --name eks-cluster && export KUBE_CONFIG_PATH=~/.kube/config

else
    echo "Error: eks-cluster does not exist"
fi