#!/bin/bash
BRANCH=master

cd $(dirname $0)
kubectl create namespace $BRANCH
sed "s|__BRANCH__|${BRANCH}|g" template.yaml | kubectl apply -f -

