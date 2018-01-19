#!/bin/bash

if [[ "$(uname -s)" = "Darwin" ]]; then
  # from https://tobywf.com/2017/05/installing-pyicu-on-macos/
  if [[ ! ${ICU_VERSION} ]]; then
    path_to_icu4c="/usr/local/Cellar/icu4c"
    icu_version=$(ls ${path_to_icu4c})
    icu_version_major="${icu_version%.*}"

    export ICU_VERSION="${icu_version_major}"
    export PYICU_INCLUDES="${path_to_icu4c}/${icu_version}/include"
    export PYICU_LFLAGS="-L${path_to_icu4c}/${icu_version}/lib"
  fi

  if [[ ! $(which icu-config) ]]; then
    try brew link icu4c gettext --force
  fi
fi
