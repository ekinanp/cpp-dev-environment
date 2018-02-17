#!/usr/bin/env bash

component="$1"
ref="$2"

if [[ -z "${component}" || -z "${ref}" ]];  then
  echo "USAGE: ./clone_pa_component.sh <component> <ref>"
  exit 1
fi

# TODO: Parametrize on the user!
git clone https://github.com/ekinanp/${component}.git

pushd "${component}"
  git checkout "${ref}"
popd
