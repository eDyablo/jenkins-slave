#!/usr/bin/env bash

set -o errexit
set -o pipefail

image_name="${IMAGE_NAME:-"jnlp-slave"}"
image_version="${IMAGE_VERSION:-$(cat version)}"
image_repository="${IMAGE_REPOSITORY:-"addword"}"
image_build_tag="${IMAGE_TAG:-"${image_repository}"/"${image_name}"}"
image_tag="${IMAGE_TAG:-"${image_build_tag}""${image_version:+":${image_version}"}"}"
docker_context="."
docker_file="Dockerfile"

docker build --tag="${image_build_tag}" --file="${docker_file}" "${docker_context}"
docker tag ${image_build_tag} ${image_tag}