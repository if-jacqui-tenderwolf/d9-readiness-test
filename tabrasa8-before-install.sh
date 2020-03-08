#!/bin/bash

# Pulls the if-lhridley/tabrasa8-docker-stack code into this project for a docker testing stack
  curl -L -O https://github.com/if-lhridley/tabrasa8-docker-stack/archive/develop.zip
  unzip develop.zip
  cp -r tabrasa8-docker-stack-develop/. .
  rm -Rf tabrasa8-docker-stack-develop
