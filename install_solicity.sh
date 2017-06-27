#!/bin/bash
currentPWD=$PWD
cd ~
#sudo apt install build-essential
#sudo apt install cmake
git clone --recursive https://github.com/ethereum/solidity.git
cd solidity
git submodule update --init --recursive
./scripts/install_deps.sh
cd $currentPWD
