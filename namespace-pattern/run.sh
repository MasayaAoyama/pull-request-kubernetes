#!/bin/bash
BRANCH=master

kubectl create namespace $BRANCH
sed "s|__BRANCH__|${BRANCH}|g" template.yaml | kubectl apply -f -

