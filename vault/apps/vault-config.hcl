path "secret/data/app/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/metadata/app/*" {
  capabilities = ["list"]
}

path "database/creds/app-role" {
  capabilities = ["read"]
}

path "auth/kubernetes/role/app-role" {
  capabilities = ["read", "create", "update"]
}