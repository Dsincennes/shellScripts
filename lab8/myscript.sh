#! /bin/bash

#Lab8
#Donald Sincennes - 041011305
#CST8102 - SEC 303
#myscript.sh
#july 30 / 21
#User management script, creates accounts, groups, login shells and expriation dates for accounts within a menu

choice="z"

#while loop to continue menu unless q for exit
 while [ "$choice" != "Q" ] && [ "$choice" != "q" ]
do
#clear menu after each prompt
clear 
#menu options
echo "Choose one of the following options:"
echo "A Create a user account"
echo "B Delete a user account"
echo "C Change supplementary group for a user account"
echo "D Change initial group for a user account"
echo "E Change default login shell for a user account"
echo "F Change account expiration date for a user acount"
echo "Q quit"
echo -n "What would you like to do? "
#prompt user to select choice
read choice
#Choice a = add user account, prompts user to add username,
#home directory and loginshell, then creates username.
if [ "$choice" = "a" ] || [ "$choice" = "A" ]
then
	echo -n "Enter Username: "
	read username
	echo -n  "Enter User's Home directory (absolute path): "
	read homed
	echo -n "Enter login shell (absolute path): "
	read logins
	sudo useradd -d "$homed" -m -s "$logins" "$username"
fi
#choice b = username delete, prompts user for which username
#and deletes the username
if [ "$choice" = "b" ] || [ "$choice" = "B" ]
then
	echo -n "What User would you like to delete: "
	read userdel
	sudo userdel -r "$userdel"
fi
#choice c = setting a username to a specified groupname.
#will add group first, then set it to the user
if [ "$choice" = "c" ] || [ "$choice" = "C" ]
then
	echo -n "Which user would you like to add to a supplementary group: "
	read username
	echo -n "Which groupname would you like to add the user too: "
	read groupname
	sudo groupadd "$groupname"
	sudo usermod -G "$groupname" "$username" 
fi
#choice d = changing the initial group of a username
#first create specified group, then set it to the user
if [ "$choice" = "d" ] || [ "$choice" = "D" ]
then
	echo -n "Which user would you like to changes the initial group of: "
	read username
	echo -n "Which groupname will be used as the initial group for this user: "
	read groupname
	sudo groupadd "$groupname"
	sudo usermod -g "$groupname" "$username"
fi
#choice e = change default shell of specified username 
if [ "$choice" = "e" ] || [ "$choice" = "E" ]
then
	echo -n "Which username would you like to change the default shell for: "
	read username
	echo -n "What default shell would would you like to set for the user: "
	read shell
	sudo usermod -s "$shell" "$user"
fi
#set an expiration date of a specified username
if [ "$choice" = "f" ] || [ "$choice" = "F" ]
then
	echo -n "Which username would you like to set an expiration for: "
	read username
	echo -n "What expiration would you like to set in the formate YYYY-MM-DD : "
	read expdate
	sudo usermod -e "$expdate" "$username"
fi
#waits 3 seconds after each command
sleep 3
#end of script
done
