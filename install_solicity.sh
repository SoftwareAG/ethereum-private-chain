#!/bin/bash
currentPWD=$PWD
cd ~
git clone --recursive https://github.com/ethereum/solidity.git
cd solidity
git submodule update --init --recursive
./scripts/install_deps.sh
sudo ./scripts/build.sh install
cd $currentPWD
