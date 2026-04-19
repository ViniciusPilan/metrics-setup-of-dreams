#!/bin/bash

AWS_ACCESS_KEY_ID=$(kubectl get secret mimir-key -o jsonpath='{.data.access-key-id}' | base64 -d)
AWS_SECRET_ACCESS_KEY=$(kubectl get secret mimir-key -o jsonpath='{.data.secret-access-key}' | base64 -d)
AWS_DEFAULT_REGION=$(kubectl get secrets mimir-key -o yaml | yq .data.region | base64 -d)
ENDPOINT=$(kubectl get secret mimir-key -o jsonpath='{.data.endpoint}' | base64 -d)

echo "hi" > test-file.txt

# Upload de um arquivo local
aws --profile garage --endpoint-url http://localhost:3900 s3 cp ./test-file.txt s3://mimir-metrics/test-file.txt

# Listar objetos no bucket
aws --profile garage --endpoint-url http://localhost:3900 s3 ls s3://mimir-metrics/

# Deletar o arquivo
aws --profile garage --endpoint-url http://localhost:3900 s3 rm s3://mimir-metrics/test-file.txt

# Confirmar que foi deletado
aws --profile garage --endpoint-url http://localhost:3900 s3 ls s3://mimir-metrics/

rm test-file.txt
