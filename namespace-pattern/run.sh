#!/bin/bash
if [ -z "$1" ]; then
  echo "prease input arg1 for specify branch or commit hash"
  exit 1;
fi

BRANCH=$1

cd $(dirname $0)
kubectl create namespace $BRANCH
sed "s|__BRANCH__|${BRANCH}|g" template.yaml | kubectl apply -f -

