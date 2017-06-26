pri=eth.accounts[0];
personal.unlockAccount(pri,'manage');
sec=eth.accounts[1];
lastblockgaslimit=eth.getBlock("latest").gasLimit;
amount=web3.fromWei(eth.getBalance(sec), "ether");
eth.sendTransaction({from:pri, to:sec, value: web3.toWei(50000,"ether"), gas: lastblockgaslimit-1});
console.log('run in geth console: "web3.fromWei(eth.getBalance(eth.accounts[1]), "ether");" to get the current ether amount');
