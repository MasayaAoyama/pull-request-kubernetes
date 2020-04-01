#!/bin/bash
kubectl create ns argocd
kubectl -n argocd apply -f argocd.yaml 
kubectl -n argocd apply -f project.yaml

# for application
kubectl create namespace test

