#!env bash
kind create cluster 
kubectl delete -f demopod.yaml
