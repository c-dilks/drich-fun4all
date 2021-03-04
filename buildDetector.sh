#!/bin/bash

if [ $# -lt 1 ]; then
  echo "USAGE: $0 [detector dir] [clean(optional)]"
  exit 1
fi
if [ $# -eq 2 ]; then clean=1; else clean=0; fi

dirDet=$1
dirBuild=${dirDet}/source/build
dirInstall=${PWD}/install

echo "$dirDet"
echo "$dirBuild"
echo "$dirInstall"

mkdir -p $dirBuild
if [ $clean -eq 1 ]; then
  echo "clean build dir... done"
  rm -r $dirBuild
  mkdir -p $dirBuild
fi

pushd $dirBuild
../autogen.sh --prefix=$dirInstall && make install
popd
