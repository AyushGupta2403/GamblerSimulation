#!/bin/bash -x
echo "---------Welcome To Gambling---------"
#variable
stake=100
cash=$stake
winCount=0
lossCount=0
#constant
BET=1
WIN=1


	function Gambler()
	{
		BET++
		winOrLoss=$((RANDOM%2))
		if (($winOrLoss == $WIN ))
		then
			echo "WIN"
			((cash++))
		else
			echo "LOSE"
			((cash--))
		fi
		echo $cash
		echo $BET
	}

	echo "$(Gambler)"
