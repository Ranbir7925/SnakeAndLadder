#!/bin/bash
echo "*********************WELCOME TO SNAKE AND LADDER SIMULATION**************"

#CONSTANTS
PLAYER_STARTING_POSITION=0
PLAYER_WINNING_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLES
noOfDice=0
playerCurrentPosition=$PLAYER_STARTING_POSITION
positionOfPlayer1=$PLAYER_STARTING_POSITION
positionOfPlayer2=$PLAYER_STARTING_POSITION

#Checking the options for player's next move
function playerNextMove
{
	playerCurrentPosition=$1
	player=$2
	generatingRandomValues
	((noOfDice++))
	case $playerMove in
		$NO_PLAY)
			playerCurrentPosition=$playerCurrentPosition
			echo -e "$2\nDICE-->$dieValue\nMOVE-->NO PLAY\nIt's NO PLAY move Player position will be same...!!\nCurrent postion --->$playerCurrentPosition\nPositon After Move -->$playerCurrentPosition\n\n"
			;;
		$LADDER)
			#printf 
			ladderMoves $player
			;;
		$SNAKE)
			#printf "$2"
			snakeMoves $player
			;;
	esac
	printf "Number of die played:$noOfDice\n"
	#If either of the player reaches the 100th position first then that player wins and the game's stopped
	if (( $playerCurrentPosition == 100 ))
	then
		echo -e "\n$2 wins"
		exit
	fi
}

#Function to Generate random values for die roll and player's next move
function generatingRandomValues()
{
	playerMove=$(( RANDOM%3+1 ))
	dieValue=$(( RANDOM%6+1 ))
}

#Function to perform the ladder's operation
function ladderMoves()
{
	playerCurrentPosition=$(( $playerCurrentPosition + $dieValue ))
	if (( $playerCurrentPosition > $PLAYER_WINNING_POSITION ))
	then
		playerCurrentPosition=$(( $playerCurrentPosition - $dieValue ))
	fi
	echo -e "$1\nDICE-->$dieValue\nMOVE-->LADDER MOVE\nIt's LADDER MOVE Player position will be incremented by $dieValue\nCurrent postion ---> $(( $playerCurrentPosition-$dieValue ))\nPositon After Move -->$playerCurrentPosition\n\n"
}

#Function to perform the snake's operation
function snakeMoves()
{
	echo -e "$1\nDICE-->$dieValue\nMOVE-->SNAKE MOVE\nIt's SNAKE MOVE Player position will be decremented by $dieValue\nCurrent postion --->$playerCurrentPosition"
	playerCurrentPosition=$(( $playerCurrentPosition - $dieValue ))
	if (( $playerCurrentPosition < $PLAYER_STARTING_POSITION))
	then
		playerCurrentPosition=$PLAYER_STARTING_POSITION
	fi
	echo -e "Positon After Move -->$playerCurrentPosition\n\n"
}

#Function to play till one of  the player wins
function play()
{
	while (( $positionOfPlayer1 < $PLAYER_WINNING_POSITION && $positionOfPlayer2 < $PLAYER_WINNING_POSITION ))
	do
		playerNextMove $positionOfPlayer1 Player1
		positionOfPlayer1=$playerCurrentPosition

		playerNextMove $positionOfPlayer2 Player2
		positionOfPlayer2=$playerCurrentPosition
	done
}

#MAIN

play
