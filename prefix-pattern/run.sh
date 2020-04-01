#!/bin/bash
BRANCH=master

sed "s|__BRANCH__|${BRANCH}|g" template.yaml | kubectl apply -f -

