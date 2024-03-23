#!/bin/bash

res=$(oc whoami -t 2>&1);
if [ $? -eq 1 ]; then 
  oc login --web https://api.sandbox-m2.ll9k.p1.openshiftapps.com:6443 >/dev/null 2>&1;
  res=$(oc whoami -t 2>&1);
fi

cat <<< '{
  "apiVersion": "client.authentication.k8s.io/v1",
  "kind": "ExecCredential",
  "status": {
    "token": "'$res'"
  }
}'
