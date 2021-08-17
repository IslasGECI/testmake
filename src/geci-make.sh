#!/usr/bin/env bash
#
# This script is used to make all the Makefiles targets.
#
# Usage: ./src/geci-make.sh <REPOSITORY> <REPORT> <BRANCH>
# Example: ./src/geci-make.sh isla-guadalupe mapa_densidad_censo.pdf develop

repository=$1
report=$2
branch=${3:-develop}

function pull_repository {
  repository=$1
  branch=$2
  mkdir --parents "${HOME}/.geci-make/"
  cd "${HOME}/.geci-make/" || return
  [ ! -d "${repository}" ] && git clone git@bitbucket.org:IslasGECI/"${repository}".git
  cd "${repository}" || return
  git checkout "${branch}"
  git pull
}

pull_repository "${repository}" "${branch}"
image_tag=$(jq --raw-output --arg report "${report}" '.[] | select(.report==$report) | .image_tag' analyses.json)
log="${report}@${repository}:${image_tag}"
echo ""
echo "${log}"
echo "........................................"
echo ""
docker pull "islasgeci/${repository}:${image_tag}"
docker run --env BITBUCKET_USERNAME="${BITBUCKET_USERNAME}" --env BITBUCKET_PASSWORD="${BITBUCKET_PASSWORD}" --rm --volume "${PWD}":/workdir "islasgeci/${repository}:${image_tag}" bash -c "make clean && make reports/${report}"
