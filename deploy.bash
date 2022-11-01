#!/bin/bash

SECRETS="$1"
rm -rf manifests-deploy
cp -r manifests manifests-deploy
bash replace.bash "$SECRETS" "@DOMAIN"
bash replace.bash "$SECRETS" "@MAIL"
bash replace.bash "$SECRETS" "@REPO"
bash replace.bash "$SECRETS" "@CLIENTID"
bash replace.bash "$SECRETS" "@CLIENTSECRET"
bash replace.bash "$SECRETS" "@COOKIESECRET"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/kind/deploy.yaml
kubectl apply -f manifests-deploy/
kubectl apply -f manifests-deploy/foreign/
kubectl apply -f manifests-deploy/jobs/
