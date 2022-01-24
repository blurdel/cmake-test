#!/bin/bash

me=$(basename $0)
echo "me: ${me} $@"
echo "usage: ${me} [debug|release|all]"

conf=debug
if [[ $# -eq 1 ]]; then
    conf="${1}"
fi
echo "building ${conf}"

# set case insensative match
shopt -s nocasematch

if [[ "ALL" == "${conf}" || "Debug" =~ "${conf}" ]]; then
    echo "########## Building Debug ##########"
    rm -rf Debug
    mkdir Debug
    cmake -DCMAKE_BUILD_TYPE=Debug -B Debug
    cmake --build Debug -v
#    cp config.yml Debug
    echo
fi

if [[ "ALL" == "${conf}" || "Release" =~ "${conf}" ]]; then
    echo "########## Building Release ##########"
    rm -rf Release
    mkdir Release
    cmake -DCMAKE_BUILD_TYPE=Release -B Release
    cmake --build Release -v
#    cp config.yml Release
    echo
fi

# un-set case insensative match
shopt -u nocasematch
echo "Done."
