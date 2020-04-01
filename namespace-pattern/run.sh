#!/bin/bash
if [ -z "$1" ]; then
  exit 1;
fi

BRANCH=$1

cd $(dirname $0)
kubectl create namespace $BRANCH
sed "s|__BRANCH__|${BRANCH}|g" template.yaml | kubectl apply -f -

