#!/bin/sh

set -e

host="$1"
shift
cmd="$@"

until $(curl --output /dev/null --silent --head --fail http://$host/status); do
  >&2 echo "Kong is unavailable - sleeping"
  sleep 5
done

>&2 echo "Kong is up - executing command"
# use newman as the default container command
exec newman $cmd