#! /bin/bash
#Lab9
#Donald Sincennes 
#Student ID: 041011305
#myCalc.sh
#07-30-2021
#This script will add or subtract given variables.

#add function, takes 2 parameters and performs an addition
	function add() {
		sum=$(($1 + $2))
	echo "The sum of $1 plus $2 equals $sum"
}

#substraction function, takes 2 parameters and performs the difference.
	function subtract(){
		sum=$(($1 - $2))
	echo "The result of $1 minus $2 equals $sum"
}


#making sure 3 parameters are input, if so, performs desired function, if not.. exits.
if [[ $# = 3 ]] && [[ $2 = '+' ]]
then
	add $1 $3
	exit
elif [[ $# = 3 ]] && [[ $2 = '-' ]]
then	subtract $1 $3
	exit
elif [[ $# != 3 ]] && [[ $# != 0 ]]
then
	echo "You must add or subtract two numbers. example: 1 + 1"
	exit
fi

#loop that keeps going unless X or x is input to exit. this will run through various menus
#to help a user calculate what they want to.
while [ true ]
do
read -p "C) Calculation
X) Exit
Input: " choice

#case x to exit calculator
case $choice in
	x|X)
		exit
esac #done case exit

#case c to calculate two numbers
case $choice in
	c|C)
		clear
		read -p "Please enter an integer number or X to exit: " int1
		if [[ $int1 = 'x' ]] || [[ $int1 = 'X' ]]
		then
			exit
		fi

		# + or - depending what user wants to do.
		read -p "Input + to Add  
Input - to Subtract 
X to Exit
" choice2
		if [[ $choice2 = 'x' ]] || [[ $choice2 = 'X' ]]
		then
			exit
		fi
		read -p "Please enter an integer number or X to exit: " int2
		if [[ $int2 = 'x' ]] || [[ $int2 = 'X' ]]
		then
			exit
		fi

		# if + was entered, calculator will add the two numbers and output.
		if [ $choice2 = "+" ]
		then
		result1=$(($int1 + $int2))
			echo "The sum of $int1 plus $int2 equals $result1"

		# if - was entered, calculator will subtract the two numbers and output.
		elif [ $choice2 = "-" ]
		then
		result2=$(($int1 - $int2))
		echo "The result of $int1 minus $int2 equals $result2"
		fi

		#screen pauses for 3 seconds to read output, then goes back into loop.
		sleep 3
esac #done case C
done # done while
