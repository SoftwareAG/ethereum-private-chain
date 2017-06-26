#!/bin/bash

CONTRACTNAME=greeter
CONTRACTFILE=$CONTRACTNAME.sol
JSFILE=$CONTRACTNAME.js

echo "var _$CONTRACTNAME=`solc --optimize --combined-json abi,bin,interface $CONTRACTFILE`" > $JSFILE 
