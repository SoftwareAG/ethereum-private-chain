/*******************************************************************************
 * Copyright © 2018 Software AG, Darmstadt, Germany and/or its licensors
 * SPDX-License-Identifier: Apache-2.0
 * Licensed under the Apache License, Version 2.0 (the "License");
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.                                                            
 *******************************************************************************/
pri=eth.accounts[0];
personal.unlockAccount(pri,'manage');
sec=eth.accounts[1];
lastblockgaslimit=eth.getBlock("latest").gasLimit;
amount=web3.fromWei(eth.getBalance(sec), "ether");
eth.sendTransaction({from:pri, to:sec, value: web3.toWei(50000,"ether"), gas: lastblockgaslimit-1});
console.log('run in geth console: "web3.fromWei(eth.getBalance(eth.accounts[1]), "ether");" to get the current ether amount');
