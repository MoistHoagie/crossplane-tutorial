#!/bin/bash

# Make sure Docker daemon is running

# Create cluster
kind create cluster --config kind.yaml

# Install Cilium
cilium install --version 1.17.4

# Enable hubble
cilium hubble enable

# Verify cilium is ready
echo "Checking status of Cilium..."
cilium status --wait

# Setup Hubble API
echo "Setting up Hubble API via port-forward. Open up new terminal tab..."
cilium hubble port-forward&

### Testing ###
# kubectl apply -f cilium-pods.yaml
# kubectl exec -n cilium-demo pod-a -it -- sh
# curl pod-b
