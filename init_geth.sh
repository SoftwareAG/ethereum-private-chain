#!/bin/bash

GENESISTEMPLATE=./genesis.template
GENESISFILE=./genesis.json
IDENTITY=Node1
PORT=30301
RPCPORT=8101
NETWORKID=4711
DATADIR=./datadirs
PASSWORDFILE=./passwd.txt

option_jungle="--identity $IDENTITY --datadir=$DATADIR/$IDENTITY -verbosity 6 --ipcdisable --port $PORT  --rpc --rpcport $RPCPORT --rpccorsdomain \"*\" --networkid $NETWORKID --nodiscover --rpcapi \"db,eth,net,web3\""

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

