kubectl create secret generic grafana-creds \\n  --from-literal=GF_SECURITY_ADMIN_USER=admin \\n  --from-literal=GF_SECURITY_ADMIN_PASSWORD=admin1234
