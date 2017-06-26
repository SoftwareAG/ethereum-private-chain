#!/bin/bash

IDENTITY=Node1
PORT=30301
RPCPORT=8101
NETWORKID=4711
DATADIR=./datadirs
LOGDIR=./logdirs
PASSWORDFILE=./passwd.txt
PRIMARY=0
VERBOSITY=2

if [ ! -d "$DATADIR" ]; then
   mkdir "$DATADIR"
fi

if [ ! -d "$LOGDIR" ]; then
   mkdir "$LOGDIR"
fi

option_jungle="--password $PASSWORDFILE --mine --minerthreads=4 --fast --unlock $PRIMARY --identity $IDENTITY --datadir=$DATADIR/$IDENTITY -verbosity $VERBOSITY --port $PORT --rpc --rpcport $RPCPORT --rpccorsdomain \"*\" --networkid $NETWORKID --nodiscover --rpcapi \"db,eth,net,web3\""

acc=(`geth $option_jungle account list | cut -d'{' -f2 | cut -d'}' -f1`)

geth $option_jungle --unlock $acc console 2> $LOGDIR/$IDENTITY.log
 
