loadScript("greeter.js");
_greeterContract = web3.eth.contract(JSON.parse(_greeter.contracts["greeter.sol:greeter"].abi));
_greeterCode = "0x"+_greeter.contracts["greeter.sol:greeter"].bin;
greeterContract =  _greeterContract.new("Hello Greeter",{from:eth.accounts[0], data: _greeterCode, gas: eth.getBlock("latest").gasLimit-1},function(e, contract){
  if(!e) {

    if(!greeter.address) {
      console.log("Contract transaction send: TransactionHash: " + greeter.transactionHash + " waiting to be mined...");

    } else {
      console.log("Contract mined! Address: " + greeter.address);
      console.log(contract);
    }

  }
});

