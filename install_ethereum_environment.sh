#!/bin/bash
#*******************************************************************************
# Copyright © 2018 Software AG, Darmstadt, Germany and/or its licensors
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.                                                            
#*******************************************************************************
currentDir=$PWD

sudo add-apt-repository ppa:ethereum/ethereum
sudo add-apt-repository ppa:ethereum/ethereum-dev
sudo apt-get update
sudo apt-get install jq
sudo apt-get install solc

echo "***** solc version check ****************"
echo
echo
solc --version
echo
echo "*****************************************"

### for testrpc we need nodejs > 6.9.1
cd ~
#curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
wget -qO- https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs
npm install ethereumjs-testrpc
sudo ln -s ~/node_modules/ethereumjs-testrpc/bin/testrpc /usr/bin/testrpc
#cd $currentDir

### we need golang in the exact version 1.8.1
wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
sudo tar -xvf go1.8.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local
sudo rm go1.8.1.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export GOPATH=$PWD
echo "verifying golang ..."
echo
echo
$GOROOT/bin/go version
echo
echo
echo "end go verification"
### end golang

### gets geth in version 1.6.6
cd $currentDir
sudo apt-get install software-properties-common
sudo apt-get update
sudo apt-get install ethereum

echo "verifying geth ..."
echo
echo
geth version
echo
echo 
echo "end geth verification"

