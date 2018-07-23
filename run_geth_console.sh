#!/bin/bash
#*******************************************************************************
# Copyright © 2018 Software AG, Darmstadt, Germany and/or its licensors
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.                                                            
#*******************************************************************************

IDENTITY=Node1
PORT=30301
RPCADDR=192.168.122.18		#127.0.0.1
RPCPORT=8101
NETWORKID=4711
DATADIR=./datadirs
LOGDIR=./logdirs
PASSWORDFILE=./passwd.txt
PRIMARY=0
VERBOSITY=3

if [ ! -d "$DATADIR" ]; then
   mkdir "$DATADIR"
fi

if [ ! -d "$LOGDIR" ]; then
   mkdir "$LOGDIR"
fi

option_jungle="--dev --password $PASSWORDFILE --mine --minerthreads=4 --fast --unlock $PRIMARY --identity $IDENTITY --datadir=$DATADIR/$IDENTITY -verbosity $VERBOSITY --port $PORT --rpc --rpcaddr $RPCADDR --rpcport $RPCPORT --rpccorsdomain \"*\" --networkid $NETWORKID --nodiscover --rpcapi \"db,eth,net,web3\""

acc=(`geth $option_jungle account list | cut -d'{' -f2 | cut -d'}' -f1`)

geth $option_jungle --unlock $acc console 2> $LOGDIR/$IDENTITY.log
 
