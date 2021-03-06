#!/bin/bash

# This script clones the IF Tabrasa8 repository from the IFSight Github Repository
# (https://github.com/IFSight/tabrasa8) and pushes it to the one located at https://github.com/if-lhridley/tabrasa8.
# This is for build and test purposes only.  All maintenance work is completed on https://github.com/IFSight/tabrasa8



# Clones the if-lhridley Tabrasa repo from Github, which is pulled nightly from IFSight/Tabrasa8
git clone https://github.com/if-lhridley/tabrasa8.git
cd tabrasa8
# Adds tracking for all remote branches to the workspace
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
# Fetches and pulls all remote branchs and tags
git fetch --all
git pull --all
git fetch --tags

git checkout d9-readiness-assessment
rm -Rf .git
cd ..
cp -r tabrasa8/. .
rm -Rf tabrasa8

composer install
cd ./docroot/sites/default
curl -O https://git.drupalcode.org/project/drupal/-/raw/8.8.x/sites/default/default.settings.php 
cd ../../..
