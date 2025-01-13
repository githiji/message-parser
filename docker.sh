#!/usr/bin/env bash

# Run this file without any args if you want to use Docker to test the Lambda function locally with mocked responses.

# Set bash unofficial strict mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -exo pipefail

# Less eager word splitting - no space.
IFS=$'\n\t'
# Set DEBUG to true for enhanced debugging: run prefixed with "DEBUG=true"
${DEBUG:-false} && set -vx

# Make debugging easier
# See: https://github.com/rawiriblundell/wiki.bash-hackers.org/blob/main/scripting/debuggingtips.md#making-xtrace-more-useful
export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

declare DIR_HOME
DIR_HOME="$(cd "$(dirname "$0")/" && pwd)"

docker_build() {
  docker compose up --build
}

docker_run() {
  docker compose run mtp python manage.py migrate
}

main() {
  case "${1}" in
    run)
      docker_build
      docker_run
      ;;

    *)
      echo "[ ERROR ]: Unsupported argument '${1}'"
      ;;
  esac
}

main "$@"
