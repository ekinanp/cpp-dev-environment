#!/usr/bin/env bash

component="$1"
ref="$2"

if [[ -z "${component}" || -z "${ref}" ]];  then
  echo "USAGE: ./build_pa_component.sh <component> <ref>"
  exit 1
fi

git clone https://github.com/puppetlabs/${component}.git

pushd "${component}"
  git checkout "${ref}"
  mkdir "release"
  pushd "release"
    cmake ..
    make install
  popd
popd
