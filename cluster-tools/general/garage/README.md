Ref: https://github.com/rajsinghtech/garage-operator/blob/main/README.md#quick-start

To type in terminal (required):
```sh
kubectl create secret generic garage-admin-token \
  --from-literal=admin-token=$(openssl rand -hex 32)
```

To create:
```yaml
apiVersion: v1
data:
  admin-token: Y2Y3YWM4ZTdkNDkzMmEzMzBlZDQxOWI4NTAwNTcyODI3YmY1NmY1N2NmZjdiMjQ2NDQ4ZTNhODVkNzQ3YmI0MQ==
kind: Secret
metadata:
  creationTimestamp: null
  name: garage-admin-token
```