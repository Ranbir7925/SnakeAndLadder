#!/bin/bash 
echo "*********************WELCOME TO SNAKE AND LADDER SIMULATION**************"
declare -A diceAndPosition


#CONSTANT
PLAYER_START_POSITION=0
PLAYER_WINNING_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLE
noOfDice=0
playerCurrentPosition=$PLAYER_START_POSITION

#Checking the options for player's next move
function playerNextMove()
{
	(( noOfDice++ ))
	randomValues
	case $playerMove in
			$NO_PLAY)
					playerCurrentPosition=$playerCurrentPosition
					echo -e "DICE-->$dieValue\nMOVE-->NO PLAY\nIt's NO PLAY move Player position will be same...!!\nCurrent postion --->$playerCurrentPosition\nPositon After Move -->$playerCurrentPosition\n\n"
					;;
			$LADDER)
					ladderMove
					;;
			$SNAKE)
					snakeMove
					;;
	esac
	#printf "Reached to position : $timeOfReachedPosition"
}


#Function to Generate random values
function randomValues()
{
	dieValue=$(( RANDOM%6+1 ))
	playerMove=$(( RANDOM%3+1 ))
}


#Function to perform the snake's operation
function snakeMove()
{
	echo -e "DICE-->$dieValue\nMOVE-->SNAKE MOVE\nIt's SNAKE MOVE Player position will be decremented by $dieValue\nCurrent postion --->$playerCurrentPosition"
	playerCurrentPosition=$(( playerCurrentPosition - dieValue ))
	if (( playerCurrentPosition < $PLAYER_START_POSITION ))
	then
		playerCurrentPosition=$PLAYER_START_POSITION
	fi
	echo -e "Positon After Move -->$playerCurrentPosition\n\n"

}


#Function to perform the ladder's operation
function ladderMove()
{
	playerCurrentPosition=$(( playerCurrentPosition + dieValue ))
	if (( $playerCurrentPosition > $PLAYER_WINNING_POSITION ))
	then
		playerCurrentPosition=$(( $playerCurrentPosition - $dieValue ))
	fi
	echo -e "DICE-->$dieValue\nMOVE-->LADDER MOVE\nIt's LADDER MOVE Player position will be incremented by $dieValue\nCurrent postion ---> $(( $playerCurrentPosition-$dieValue ))\nPositon After Move -->$playerCurrentPosition\n\n"

}



function play()
{
	while (( $playerCurrentPosition < $PLAYER_WINNING_POSITION ))
	do
		playerNextMove
	done
}


play
printf "Total no of Dice Played : $noOfDice"
