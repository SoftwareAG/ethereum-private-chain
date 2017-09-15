Copy the commands one by one into geth !!!


eth.defaultAccount=eth.accounts[0];
eth.sendTransaction({"from":eth.accounts[0],"to":eth.accounts[1],"value":1000});
eth.sendTransaction({"from":eth.accounts[0],"to":eth.accounts[2],"value":1001});
console.log("account1 balance: "+eth.getBalance(eth.accounts[1]));
console.log("account2 balance: "+eth.getBalance(eth.accounts[2]));
personal.unlockAccount(eth.accounts[1]);
personal.unlockAccount(eth.accounts[2]);
console.log("auction bid from 1: "+auction.bid({"from":eth.accounts[1],"value":100}));
console.log("account1 balance: "+eth.getBalance(eth.accounts[1]));
console.log("account1 balance: "+eth.getBalance(eth.accounts[2]));
var highest_bid = auction.getHighestBid.call();
var highest_bidder = auction.getHighestBidder.call();
console.log("highest bid: "+highest_bid);
console.log("highest bidder: "+highest_bidder);
console.log("auction bid from 2: "+auction.bid({"from":eth.accounts[2],"value":200}));
console.log("account1 balance: "+eth.getBalance(eth.accounts[1]));
console.log("account2 balance: "+eth.getBalance(eth.accounts[2]));
var highest_bid = auction.getHighestBid.call();
var highest_bidder = auction.getHighestBidder.call();
console.log("highest bid: "+highest_bid);
console.log("highest bidder: "+highest_bidder);
console.log("account1 balance: "+eth.getBalance(eth.accounts[1]));
console.log("account2 balance: "+eth.getBalance(eth.accounts[2]));
console.log("withdrawRefund from 1: "+auction.withdrawRefund(eth.accounts[1]));
console.log("account1 balance: "+eth.getBalance(eth.accounts[1]));
console.log("account2 balance: "+eth.getBalance(eth.accounts[2]));

