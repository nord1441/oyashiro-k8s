#!/bin/bash

DIR="$1"
kubectl create secret generic ca-secret --from-file=tls.crt=$DIR/server.crt --from-file=tls.key=$DIR/server.key --from-file=ca.crt=$DIR/ca.crt
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f manifests/
