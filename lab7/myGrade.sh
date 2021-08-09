#! /bin/bash

#Donald Sincennes
#studentID: 41011305
#linux 8102
#Section 303 Lab 7 july 10th, 2021
#Grade calculator

clear

RED=$'\e[1;31m'
NC=$'\033[0m'

echo -n "Enter Assignment mark (0 - 40): $RED"
read mark1
echo "$NC"

echo -n "Enter Test 1 mark (0 - 15): $RED"
read mark2
echo "$NC"

echo -n "Enter Test 2 mark (0 - 15): $RED"
read mark3
echo "$NC"

echo -n "Enter Final exam mark (0 - 30): $RED"
read mark4
echo "$NC"

finalMark=$((mark1+mark2+mark3+mark4))

if [ $finalMark -ge 90 ]; then
	finalGrade="A+"
elif [ $finalMark -ge 85 ]; then
	finalGrade="A"
elif [ $finalMark -ge 80 ]; then
	finalGrade="A-"
elif [ $finalMark -ge 77 ]; then
	finalGrade="B+"
elif [ $finalMark -ge 73 ]; then
	finalGrade="B"
elif [ $finalMark -ge 70 ]; then
	finalGrade="B-"
elif [ $finalMark -ge 67 ]; then
	finalGrade="C+"
elif [ $finalMark -ge 63 ]; then
	finalGrade="C"
elif [ $finalMark -ge 60 ]; then
	finalGrade="C-"
elif [ $finalMark -ge 57 ]; then
	finalGrade="D+"
elif [ $finalMark -ge 53 ]; then
	finalGrade="D"
elif [ $finalMark -ge 50 ]; then
	finalGrade="D-"
elif [ $finalMark -le 49 ]; then
	finalGrade="F"
fi

echo "Your final numeric grade is $RED$finalMark$NC, and final letter grade is $RED$finalGrade$NC"

