#!/bin/bash

IDENTITY=Node1
PORT=30301
RPCPORT=8101
NETWORKID=4711
DATADIR=./datadirs
LOGDIR=./logdirs
PASSWORDFILE=./passwd.txt
PRIMARY=0

if [ -z "$1" ]; then
   echo "usage: "$0" <jsfile name>"
   exit -1
fi

scriptcmd="loadScript(\""$1"\")"

if [ ! -d "$DATADIR" ]; then
   mkdir "$DATADIR"
fi

if [ ! -d "$LOGDIR" ]; then
   mkdir "$LOGDIR"
fi

option_jungle="--password $PASSWORDFILE --mine --minerthreads=4 --fast --unlock $PRIMARY --identity $IDENTITY --datadir=$DATADIR/$IDENTITY -verbosity 6 --port $PORT --rpc --rpcport $RPCPORT --rpccorsdomain \"*\" --networkid $NETWORKID --nodiscover --rpcapi \"db,eth,net,web3\""

geth $option_jungle --exec $scriptcmd attach ipc:$DATADIR/$IDENTITY/geth.ipc console 2> $LOGDIR/$IDENTITY.log

