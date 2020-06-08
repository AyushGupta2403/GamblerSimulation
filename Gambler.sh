#!/bin/bash -x
echo "---------Welcome To Gambling---------"

#Constants
STAKE=100
BET=1
ISWIN=1

#Checking for a month
for (( index=1; index<=20; index++ ))
do
#Variable
	cash=$STAKE
	minimum=$(($STAKE-$STAKE/2))
	maximum=$(($STAKE+$STAKE/2))
	while (( $cash != $minimum && $cash != $maximum ))
	do
#Checking for a Win Or Loss Randomly
		randomCheck=$((RANDOM%2))
		if [ $randomCheck -eq $ISWIN ]
		then
			echo win
			((cash++))
		else
			echo lose
			((cash--))
		fi
			dayWonLoss=$(($cash-$STAKE))
	done
	totalAmount[index]=$cash
	dayWonLoss[index]=$dayWonLoss
done
echo "Total Amount won or loss :: "${totalAmount[@]}
echo "Days won and Loss by :: "${dayWonLoss[@]}
