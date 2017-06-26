#!/bin/bash
currentDir=$PWD
### for testrpc we need nodejs > 6.9.1
cd ~
sudo apt-get install build-essential
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs
npm install ethereumjs-testrpc
sudo ln -s ~/node_modules/ethereumjs-testrpc/bin/testrpc /usr/bin/testrpc
cd $currentDir

### we need golang in the exact version 1.8.1
sudo curl -O https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
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
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

echo "verifying geth ..."
echo
echo
geth version
echo
echo 
echo "end geth verification"

### install solicity compiler
#sudo apt-get install solc
#which solc

echo "****** to be done **************"
echo "*** proper install latest solc compiler ***"
echo "*********************************"
exit -1
cd ~
sudo apt install cmake
git clone https://github.com/ethereum/cpp-ethereum.git
mkdir cpp-ethereum/build
cd cpp-ethereum/build
cmake -DJSONRPC=OFF -DMINER=OFF -DETHKEY=OFF -DSERPENT=OFF -DGUI=OFF -DTESTS=OFF -DJSCONSOLE=OFF ..
make -j4
sudo make install
which solc

