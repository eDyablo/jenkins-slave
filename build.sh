#!/usr/bin/env bash

set -o errexit
set -o pipefail

image_name="${IMAGE_NAME:-"jnlp-slave"}"
image_version="${IMAGE_VERSION:-}"
image_repository="${IMAGE_REPOSITORY:-"addword"}"
image_tag="${IMAGE_TAG:-"${image_repository}"/"${image_name}""${image_version:+":${image_version}"}"}"
docker_context="."
docker_file="Dockerfile"

docker build --tag="${image_tag}" --file="${docker_file}" "${docker_context}"
