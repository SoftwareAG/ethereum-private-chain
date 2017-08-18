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

# Creating a transaction 

Running the command run_geth_console will start the cli for Ethereum. This script will also start mining. The outputs of the console should be "tailed" in an additional command shell located in logsdir/<identity>.log.

In a third shell the ethereum action is triggered by running exec_geth_jsscript.sh with the filename of the appropriated action, in this case doATransaction.js.

The result of this action is the transmission of ether from account[0]-wallet to account[1]-wallet. By specifying "eth.fromWei(eth.getBalance(eth.account[1]), ether");" in geth cli before and after the transmission of ether, the increase of ether for account[1] can be monitored. 

# Creating a contract

Contracts are written in a language called "solidity" (beside solidity there are currently 2 other languages to describe a contract). The solidity contract greeter.sol is converted via generate_contract.sh into the file greeter.js. You can run the greeter.js from within geth.

## The following steps are explainng the generation of contract in more detail

1) Create or download a valid solidity contract file.
2) Run generate_contract <contract file name>.sol
3) Edit the auto-generated <contract file name>.js and adjust the settings (explaination see inside the file)
4) In geth run 'loadScript("<contract file name>.js")'. Don't forget the quotes!!!
5) Wait for the ethereum mining completed message.

# Issues

not known

  ______________________
These tools are provided as-is and without warranty or support. They do not constitute part of the Software AG product suite. Users are free to use, fork and modify them, subject to the license agreement. While Software AG welcomes contributions, we cannot guarantee to include every contribution in the master project.	

Contact us at [TECHcommunity](mailto:technologycommunity@softwareag.com?subject=Github/SoftwareAG) if you have any questions.
