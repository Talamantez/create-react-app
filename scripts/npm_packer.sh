#!/bin/bash

# This script produces a .tgz scoped within @tcc with a proper name that does not include the tcc.
# Somehow npm pack and npm publish do not produce the same .tgz filename :(

set -e
set -x

# complain loudly if no args supplied
if [[ $1 == "" ]]; then
    echo "Please specify project name as an argument"
    exit 1
fi
export PROJECT=$1

# optional arg for directory if the package we want to publish isn't in the project root
export PKG_DIR=$2
if [[ $PKG_DIR == "" ]]; then
    export PKG_DIR="."
fi

pushd $PKG_DIR
export TARGET_VERSION=$(node -p "require('./package.json').version")
export LATEST_DEPLOYED_VERSION=$(npm view @tcc/$PROJECT version)
# we're only building a new .tgz if the package.json version got bumped
if [[ $TARGET_VERSION != $LATEST_DEPLOYED_VERSION ]]; then
    npm pack
    export TGZ_FILE=$(find . -name "tcc-$PROJECT*.tgz" -type f -print)
    mv $TGZ_FILE $PROJECT-$TARGET_VERSION.tgz
fi
popd
# otherwise no .tgz and the stashbot artifactory plugin will see no file and move on peacefully
