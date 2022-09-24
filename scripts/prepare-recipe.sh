#!/usr/bin/env bash

set -ex

rm -f meta.yaml
wget https://raw.githubusercontent.com/conda-forge/superset-feedstock/main/recipe/meta.yaml
export URL_PATTERN="https\:\/\/pypi\.io\/packages\/source\/.*\.tar\.gz$"
export GIT_URL="https://github.com/apache/superset.git"
export BUILD_NUMBER=1
export BRANCH_NAME="main"
# export URL_FILE="${URL_ROOT}/master.tar.gz"
# export PKG_VERSION=$(conda search superset|tail -n 1|grep -o -E '[0-9]+\.[0-9]+\.[0-9]+')


sed -i "s|url: ${URL_PATTERN}|git_url: ${GIT_URL}\n  git_rev: ${BRANCH_NAME}|" meta.yaml
# sed -i "s|{{ version }}|${PKG_VERSION}|" meta.yaml
sed -i "s|number: ${BUILD_NUMBER}|number: {{ environ.get('GIT_DESCRIBE_NUMBER', 0) }}|" meta.yaml