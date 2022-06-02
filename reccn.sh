#!/bin/bash
echo "================================================================="
echo "|  |^^^^|	 |^^^^^^  |^^^^^^  |^^^^^^^|   |\    |	  |\	|    |"
echo "|	 |____|  | 	  |	   |	   |   | \   |	  | \	|    |"
echo "|	 |\	 |-----	  |	   |	   |   |  \  |	  |  \	|    |"
echo "|	 | \	 |	  |	   |	   |   |   \ |	  |   \ |    |"
echo "|	 |  \	 |______  |______  |_______|   |    \|    |    \|    |"
echo "================================================================="
echo
echo
echo "-------------------------------------------------------------"
echo "| Welcome to my newly made Recconiasance Automator.         |"    
echo "| This tool is design to automate your reconniasance phase. |"
echo "| To start reccon please hit 1, If not please hit 0.        |"
echo "|___________________________________________________________|"
echo
# Taking input from the user for running this script or not.
read a
if [ $a -eq 1 ] ;
then
echo "Great Choice!!"
echo 
echo "Please enter a valid domain name"
# Taking input from the user i.e. tesla.com
read b
echo
# NS lookup command
echo "NSLOOKUP is starting"
nslookup $b   
echo "----------------------------------------------------------------"
echo
#who is command
echo "WHOIS is starting"
whois $b
echo
echo "----------------------------------------------------------------"
echo
# Dig command
echo "DIG is Starting"
dig $b
echo
echo "----------------------------------------------------------------"
echo "Sublist3r is Startig"
# sublister command
sublist3r -d $b -o domains.txt
echo
echo "----------------------------------------------------------------" 
echo
echo "Now Showing you the ip addresses of the obtained sub-domains"
echo "-----------------------------------------------------------------"
input="/home/kali/Recconiasance/domains.txt"
while IFS= read -r line
do
#  nslookup $line >> ipaddress.txt 
done < "$input"
echo "-----------------------------------------------------------------"
echo
echo
echo "-----------------------------------------------------------------"
echo
echo "The harvester is starting"
# theHarvester -d $b -b all
echo
echo "-----------------------------------------------------------------"
echo "NMAP is starting"
echo "This will give the open ports of the given domain"
sudo namp -O $b
elif [ $a -eq 0 ] ;
then 
echo "Sad to know you are not willing to use me :("
else
echo "Invalid Input!"
fi
