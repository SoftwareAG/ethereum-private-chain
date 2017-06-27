# ethereum-private-chain
Tutorial for setting up an Ethereum private chain, sending transactions, and doing smart contracts ...

# Prerequisites

This tutorial was tested on Ubuntu 16.04. Test on CentOS 7.0 were unsuccessful because of the lack of the solidity compiler for CentOS.

# Installation

1) Install the OS and fix it.
2) Disable the firewall and install OpenSSH server (apt-get install openssh-server)
3) Install git (apt-get install git)
4) Clone this repository.
5) cd to ethereum-private-chain dir
6) run ./install_ethereum_environment.sh

# Initialize the Ethereum private chain

Running the script init_geth.sh will generate the genesis block for the private chain and assign suffient ether to the predefined account[0]. The datadir and log dir is created. Several geth consoles can now be started to work together based on this block chain.

# Creatng a transaction 

Running the command run_geth_console will start the cli for Ethereum. This script will also start mining. The outputs of the console should be "tailed" in an additional command shell located in logsdir/<identity>.log.

In a third shell the ethereum action is triggered by running exec_geth_jsscript.sh with the filename of the appropriated action, in this case doATransaction.js.

The result of this action is the transmission of ether from account[0]-wallet to account[1]-wallet. By specifying "eth.fromWei(eth.getBalance(eth.account[1]), ether");" in geth cli before and after the transmission of ether, the increase of ether for account[1] can be monitored. 

# Creating a contract

Contracts are written in a language called "solidity" (beside solidity there are currently 2 other languages to describe a contract). The solidity contract greeter.sol is converted via generate_contract.sh into the file greeter.js. This file is loaded via the exec_geth_jsscript.sh specifying doAContract.js as input for the action. The contract execution can be monitored via the log file.

# Issues

Currently the address of the contract, which is necessary to state the contract "valid" is undefined. Question is: Is this a Ethereum bug or am I missing something, or is this just a matter of time and resources missing???
