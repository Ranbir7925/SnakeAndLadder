#!/bin/bash -x
echo "*********************WELCOME TO SNAKE AND LADDER SIMULATION**************"

#CONSTANT
PLAYER_START_POSITION=0
PLAYER_WINNING_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLE
playerCurrentPosition=$PLAYER_START_POSITION

#Checking the options for player's next move
function playerNextMove()
{
	randomValues
	case $playerMove in
			$NO_PLAY)
					playerCurrentPosition=$playerCurrentPosition
					;;
			$LADDER)
					playerCurrentPosition=$(( playerCurrentPosition + dieValue ))
					;;
			$SNAKE)
					playerCurrentPosition=$(( playerCurrentPosition - dieValue ))
					;;
	esac
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
	playerCurrentPosition=$(( playerCurrentPosition - dieValue ))
	if (( playerCurrentPosition < 0 ))
	then
		playerCurrentPosition=$PLAYER_START_POSITION
	fi
}


#Function to perform the ladder's operation
function ladderMove()
{
	playerCurrentPosition=$(( playerCurrentPosition + dieValue ))
}


function play()
{
	while (( $playerCurrentPosition < $PLAYER_WINNING_POSITION ))
	do
		playerNextMove
	done
}


play
