mongo -- "$MONGO_INITDB_DATABASE" <<EOF
db.createUser(
  {
    user: "mongoadmin",
    pwd: "secret",
    roles: [ { role: "readWrite", db: "cytomine" } ]
  }
)
EOF