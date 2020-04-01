#!/bin/bash
kubectl create ns argocd
kubectl -n argocd apply -f argocd.yaml 

