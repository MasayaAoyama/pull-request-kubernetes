#!/bin/bash
if [ -z "$1" ]; then
  echo "prease input arg1 for specify branch or commit hash"
  exit 1;
fi

BRANCH=$1
OP=${2:-create}

cd $(dirname $0)
sed "s|__BRANCH__|${BRANCH}|g" template.yaml | kubectl ${OP} -f -

if [ $OP == "create" ]; then
  until kubectl get svc -n test | grep ${BRANCH}; do sleep 3; done
fi
