#!/bin/bash -x
echo "*********************WELCOME TO SNAKE AND LADDER SIMULATION**************"
#CONSTANT
PLAYER=1
PLAYER_START_POSITION=0

#VARIABLE
random=$((RANDOM%6+1))
echo "After rolling die Player got $random"
