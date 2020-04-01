package httpapi.authz

default allow = false

# Allows users with role 'tester' to GET anything under '/status'
allow {
  input.method == "GET"
  glob.match("/status**", ["/"], input.path)
  input.token.payload.role == "tester"
}