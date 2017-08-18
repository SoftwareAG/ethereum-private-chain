#!/bin/bash

if [ -z "$1" ]; then
   echo "usage: "$0" <solc file name>"
   exit -1
fi

function getAbi {
   abi=$( echo $contractContent  | jq '.'$1'.abi' )
   abi=${abi/\"[/[}
   abi="var "$2" = web3.eth.contract("$abi");"
   abi=${abi/\}]\");/\}]);}
   abi=${abi//\\/''}
   echo $abi >> $CONTRACTPATH$JSFILE
   echo >> $CONTRACTPATH$JSFILE
}

function getBin {
   bin=$( echo $contractContent  | jq '.'$1'.bin' )
   bin="\"0x${bin/\"/''}"
   bin=${bin//\"/\'}
   gas="var "$3"Gas = web3.eth.estimateGas({data: "$bin"})*2;"
   bin="var "$3" = "$2".new(<parm1,parm2...,parmn>,{from: web3.eth.accounts[0], data: "$bin",gas: "$3"Gas }, function (e, contract){console.log(e, contract);if (typeof contract.address !== 'undefined') {console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);}});"
   echo $gas >> $CONTRACTPATH$JSFILE
   echo >> $CONTRACTPATH$JSFILE
   echo $bin >> $CONTRACTPATH$JSFILE
   echo >> $CONTRACTPATH$JSFILE
}

CONTRACTFILE=$(basename "$1")
CONTRACTPATH=${1/$CONTRACTFILE/}
JSFILE=${CONTRACTFILE/.sol/.js}
CONTRACT=${CONTRACTFILE/.sol/}

#echo $CONTRACTFILE $CONTRACTPATH $JSFILE $CONTRACT

echo "var _$CONTRACT=`solc --optimize --combined-json abi,bin,interface $CONTRACTFILE`" > $CONTRACTPATH$JSFILE

contractContent=$(cat $CONTRACTPATH$JSFILE | cut -d'=' -f2 | jq '.contracts')
contract_keys="$( echo $contractContent | jq 'keys' )"
contract_keys=${contract_keys/[/''}
contract_keys=${contract_keys/]/''}
contract_keys=${contract_keys/,/' '}

contractKeyList="$contract_keys"

echo '' > $CONTRACTPATH$JSFILE

for key in $contractKeyList
do
   cObject=${key##*:}
   cObject=${cObject/\"/''}
   cContractName=$cObject"Contract"
   #echo $c $cObject $cContractName
   getAbi $key $cContractName
   getBin $key $cContractName $cObject
done

echo "// replace all <parm1,parm2...,parmn> with the actual values before loading this script" >> $CONTRACTPATH$JSFILE
echo "// in geth: run loadScript(\""$CONTRACTPATH$JSFILE"\"); and wait ... " >> $CONTRACTPATH$JSFILE
echo "// if a contract cannot be mined -> play with the gas" >> $CONTRACTPATH$JSFILE
echo "// run the following commands in geth to enable contract:" >> $CONTRACTPATH$JSFILE
echo "// personal.unlockAccount(web3.eth.accounts[0], \"yourPassword\")" >> $CONTRACTPATH$JSFILE
echo "// eth.getCode(<your contract>.address) -> if you see anything else than \"0x\" you are there ..." >> $CONTRACTPATH$JSFILE
echo "// run in geth: <your contract>.<your contracts method>(<params>) to see it working ..." >> $CONTRACTPATH$JSFILE
echo "// to view contract mining: run txpool.status ..." >> $CONTRACTPATH$JSFILE
echo "// if you get 'Error: invalid address': provide an address as input var like {from:eth.accounts[0]} ..." >> $CONTRACTPATH$JSFILE





