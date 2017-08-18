#!/bin/bash
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

