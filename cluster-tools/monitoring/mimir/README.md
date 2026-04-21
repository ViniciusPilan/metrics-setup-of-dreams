Required secret:

```sh
apiVersion: v1
kind: Secret
metadata:
  name: mimir-key
  namespace: metrics
stringData:
  BUCKET_HOST: "garage-cluster.cluster-general-tools.svc"
  BUCKET_PORT: "3902"
  AWS_ACCESS_KEY_ID: "$(kubectl get secret mimir-key -o jsonpath='{.data.access-key-id}' | base64 -d)"
  AWS_SECRET_ACCESS_KEY: "$(kubectl get secret mimir-key -o jsonpath='{.data.access-key-id}' | base64 -d)"

```