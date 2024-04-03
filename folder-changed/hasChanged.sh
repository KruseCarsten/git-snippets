#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"




pushd $SCRIPTPATH

echo "Working path: $PWD"

# Note.. 
# 
#   git diff --quite
#
# ResultCode
#   0 no changes
#   1 different

echo "Has folder foo been changed..."
git diff --quiet HEAD master -- foo || echo "  -> changed"

echo "Check this with previous tag..."
git diff --quiet HEAD "$(git describe --tags --abbrev=0 HEAD)" -- foo || echo "  -> changed"

popd