#!/bin/sh
# Ported from https://raw.githubusercontent.com/ndmitchell/neil/master/misc/travis.sh

set -e

PACKAGE=stylish-haskell
echo Downloading and running $PACKAGE...

URL=https://github.com/jaspervdj/stylish-haskell/releases/download/v0.9.2.2/stylish-haskell-v0.9.2.2-linux-x86_64.tar.gz
VERSION=$(echo $URL | sed -e 's/.*-\(v[\.0-9]\+-linux-x86_64\)\.tar\.gz/\1/')
TEMP=$(mktemp --directory .$PACKAGE-XXXXX)

cleanup(){
    rm -r $TEMP
}
trap cleanup EXIT

curl --progress-bar --location -o$TEMP/$PACKAGE.tar.gz $URL
tar -xzf $TEMP/$PACKAGE.tar.gz -C$TEMP
$TEMP/$PACKAGE-$VERSION/$PACKAGE $*
