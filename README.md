# haproxy

frontend kubernetes-frontend
    bind 172.17.25.41:6443  # Load balancer IP, listen on port 6443
    mode tcp
    option tcplog
    default_backend kubernetes-backend

backend kubernetes-backend
    mode tcp
    balance roundrobin
    option tcp-check
    server master1 172.17.25.42:6443 check fall 3 rise 2
    server master2 172.17.25.43:6443 check fall 3 rise 2
Add the following labels and annotations to the PVC YAML file under metadata:

Add these labels:

yaml
Copy code
labels:
  app.kubernetes.io/managed-by: "Helm"
Add these annotations:

yaml
Copy code
annotations:
  meta.helm.sh/release-name: "openmetadata-dependencies"
  meta.helm.sh/release-namespace: "default"
Save the changes and then rerun the Helm install/upgrade command:

bash
Copy code
helm install openmetadata-dependencies open-metadata/openmetadata-dependencies --namespace
