/*******************************************************************************
 * Copyright © 2018 Software AG, Darmstadt, Germany and/or its licensors
 * SPDX-License-Identifier: Apache-2.0
 * Licensed under the Apache License, Version 2.0 (the "License");
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.                                                            
 *******************************************************************************/

var auctionContract = web3.eth.contract([{"constant":false,"inputs":[],"name":"withdrawRefund","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"bid","outputs":[],"payable":true,"type":"function"}]);

var auctionGas = web3.eth.estimateGas({data: '0x6060604052341561000f57600080fd5b5b6101a98061001f6000396000f300606060405263ffffffff7c0100000000000000000000000000000000000000000000000000000000600035041663110f887481146100485780631998aeef1461005d575b600080fd5b341561005357600080fd5b61005b610067565b005b61005b6100e4565b005b73ffffffffffffffffffffffffffffffffffffffff3316600081815260026020526040808220805492905590919082156108fc0290839051600060405180830381858888f1935050505015156100e05773ffffffffffffffffffffffffffffffffffffffff331660009081526002602052604090208190555b5b50565b6001543410156100f357600080fd5b60005473ffffffffffffffffffffffffffffffffffffffff1615610141576001546000805473ffffffffffffffffffffffffffffffffffffffff168152600260205260409020805490910190555b6000805473ffffffffffffffffffffffffffffffffffffffff19163373ffffffffffffffffffffffffffffffffffffffff16179055346001555b5600a165627a7a72305820e1c6b3edd528dc6bba83836f92e9f1559eea4616f9e9c931b352910ebe3179d90029'})*2;

var auction = auctionContract.new({from: web3.eth.accounts[0], data: '0x6060604052341561000f57600080fd5b5b6101a98061001f6000396000f300606060405263ffffffff7c0100000000000000000000000000000000000000000000000000000000600035041663110f887481146100485780631998aeef1461005d575b600080fd5b341561005357600080fd5b61005b610067565b005b61005b6100e4565b005b73ffffffffffffffffffffffffffffffffffffffff3316600081815260026020526040808220805492905590919082156108fc0290839051600060405180830381858888f1935050505015156100e05773ffffffffffffffffffffffffffffffffffffffff331660009081526002602052604090208190555b5b50565b6001543410156100f357600080fd5b60005473ffffffffffffffffffffffffffffffffffffffff1615610141576001546000805473ffffffffffffffffffffffffffffffffffffffff168152600260205260409020805490910190555b6000805473ffffffffffffffffffffffffffffffffffffffff19163373ffffffffffffffffffffffffffffffffffffffff16179055346001555b5600a165627a7a72305820e1c6b3edd528dc6bba83836f92e9f1559eea4616f9e9c931b352910ebe3179d90029',gas: auctionGas }, function (e, contract){console.log(e, contract);if (typeof contract.address !== 'undefined') {console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);}});

// replace all <parm1,parm2...,parmn> with the actual values before loading this script
// in geth: run loadScript("auction.js"); and wait ... 
// if a contract cannot be mined -> play with the gas
// run the following commands in geth to enable contract:
// personal.unlockAccount(web3.eth.accounts[0], "yourPassword")
// eth.getCode(<your contract>.address) -> if you see anything else than "0x" you are there ...
// run in geth: <your contract>.<your contracts method>(<params>) to see it working ...
