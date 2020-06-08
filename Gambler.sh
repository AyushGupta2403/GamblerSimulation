#!/bin/bash -x
echo "---------Welcome To Gambling---------"

#Constants
STAKE=100
BET=1
ISWIN=1

function gambler(){
 # Checking For a month
 for (( index=1; index<=20; index++ ))
 do
 #Variable
  cash=$STAKE
  minimum=$(($STAKE-$STAKE/2))
  maximum=$(($STAKE+$STAKE/2))
   while (( $cash != $minimum && $cash != $maximum ))
   do
      #Checking for Win Or Loss Randomly
       randomCheck=$((RANDOM%2))
        if [ $randomCheck -eq $ISWIN ]
        then
         ((cash++))
        else
         ((cash--))
        fi
       dayWonLoss=$(($cash-$STAKE))
   done
  totalAmount[index]=$cash
  dayWonLoss[index]=$dayWonLoss
  WonandLossAmount=$(($WonandLossAmount+$dayWonLoss))
  totalWonLossAmount[index]=$WonandLossAmount
 done
 echo "Total Amount won or loss :: "${totalAmount[@]}
 echo "Days won and Loss by :: "${dayWonLoss[@]}
 echo "Total won and Loss amount :: "${totalWonLossAmount[@]}

 #Printing Luckiest Day And Unluckiest Day
 for k in ${!totalWonLossAmount[@]}
 do
   echo $k 'thdayisLuckiest' ${totalWonLossAmount[$k]}
 done | sort -rn -k3 | head -1

 for k in ${!totalWonLossAmount[@]}
 do
   echo $k 'thdayisUnlucky' ${totalWonLossAmount[$k]}
 done | sort -rn -k3 | tail -1

 #Checking for limit to be reached
 if [ $WonandLossAmount -ge $STAKE ]
 then
  gambler
 else
  echo "You have turned broke"
 fi
}
gambler
