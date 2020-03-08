#!/bin/bash

# This script clones the IF Tabrasa8 repository from the IFSight Github Repository
# (https://github.com/IFSight/tabrasa8) and pushes it to the one located at https://github.com/if-lhridley/tabrasa8.
# This is for build and test purposes only.  All maintenance work is completed on https://github.com/IFSight/tabrasa8



# Clones the if-lhridley Tabrasa repo from Github
git clone https://github.com/if-lhridley/tabrasa8.git
cd tabrasa8
# Adds tracking for all remote branches to the workspace
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
# Fetches and pulls all remote branchs and tags
git fetch --all
git pull --all
git fetch --tags

git checkout new-composer-build
rm -Rf .git
cd ..
cp -r tabrasa8/. .
rm -Rf tabrasa8

composer install
