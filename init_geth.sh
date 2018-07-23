#!/bin/bash
#*******************************************************************************
# Copyright © 2018 Software AG, Darmstadt, Germany and/or its licensors
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.                                                            
#*******************************************************************************

GENESISTEMPLATE=./genesis.template
GENESISFILE=./genesis.json
IDENTITY=Node1
PORT=30301
RPCPORT=8101
NETWORKID=4711
DATADIR=./datadirs
PASSWORDFILE=./passwd.txt

option_jungle="--dev --identity $IDENTITY --datadir=$DATADIR/$IDENTITY -verbosity 6 --ipcdisable --port $PORT  --rpc --rpcport $RPCPORT --rpccorsdomain \"*\" --networkid $NETWORKID --nodiscover --rpcapi \"db,eth,net,web3\""

if [ ! -d "$DATADIR" ]; then
   mkdir "$DATADIR"
fi

if [ ! -d "$DATADIR/$IDENTITY" ]; then
   mkdir "$DATADIR/$IDENTITY"
fi

#generate account[0]
acc=`geth --password $PASSWORDFILE $option_jungle account new | cut -d'{' -f2 | cut -d'}' -f1`

sed "s/<account>/$acc/g" $GENESISTEMPLATE > $GENESISFILE 

echo 
echo 'updating address '$acc' in genesis file '$GENESISFILE
echo

geth $option_jungle init $GENESISFILE
geth $option_jungle --password $PASSWORDFILE account new      # account[1] 
geth $option_jungle --password $PASSWORDFILE account new      # account[2] 
geth $option_jungle account list

