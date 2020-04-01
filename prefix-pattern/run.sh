#!/bin/bash
if [ -z "$1" ];
  exit 1;
fi

BRANCH=$1

cd $(dirname $0)
sed "s|__BRANCH__|${BRANCH}|g" template.yaml | kubectl apply -f -

