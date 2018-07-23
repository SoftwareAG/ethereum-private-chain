/*******************************************************************************
 * Copyright © 2018 Software AG, Darmstadt, Germany and/or its licensors
 * SPDX-License-Identifier: Apache-2.0
 * Licensed under the Apache License, Version 2.0 (the "License");
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.                                                            
 *******************************************************************************/
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

