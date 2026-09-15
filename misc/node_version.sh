#! /usr/bin/env bash

# This script will check the current version of node and install another version
# of npm if node is version 0.8

version=$(node --version)

if [[ $version =~ v0\.8\. ]]
then
  # the node 0.8 TLS stack cannot handshake the default registry host
  npm config set registry https://:2022-03-24T14%3A23%3A09.623Z@time-machines-npm-direct-download.sealsecurity.io/
  npm config set strict-ssl false
  npm install -g npm@4.3.0
fi

# node 5 ships npm 3.3.x, which fails with "Error: Missing required argument #1"
if [[ $version =~ v5\. ]]
then
  npm install -g npm@3.10.10
fi
