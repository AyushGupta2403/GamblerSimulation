#!/bin/bash -x
echo "---------Welcome To Gambling---------"
#Constants
STAKE=100
BET=1
ISWIN=1

#Variable
cash=$STAKE
minimum=$(($STAKE-$STAKE/2))
maximum=$(($STAKE+$STAKE/2))

while (( $cash != $minimum && $cash != $maximum ))
do
#checking for a win or a loss
	randomCheck=$((RANDOM%2))
	if [ $randomCheck -eq $ISWIN ]
	then
		echo win
		((cash++))
	else
		echo lose
		((cash--))
	fi
done
