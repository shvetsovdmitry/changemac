#!/bin/bash

# Do we need to restart network-manager service?
restart_service=false
# Do we need to output macchanger's messages?
verbose=false
# Red escape character.
RED='\033[0;31m'
# Green escape character.
GREEN='\033[0;32m'
# Orange escape character.
ORANGE='\033[0;33m'

NC='\033[0m'
# Default MAC.
MAC="0A:1B:2C:3D:4E:5F"
# Device.
DEVICE="wlan0"


# Help message.
usage() {
	printf "ChangeMAC - Macchanger wrapper (2019 May 3)\n\n"
	printf "Usage: sudo changemac [arguments]\tChange MAC for specified device\n"
	printf "   or: sudo changemac [arguments] -v\tVerbose output\n\n"
	printf "   -m <MAC>\tMAC to use (Default: 0A:1B:2C:3D:4E:5F) \n"
	printf "   -d <device>\tDevice to use (Default: wlan0) \n"
	printf "   -r\t\tRestart network-manager \n"
	printf "   -v\t\tVerbose output \n"
	printf "   -h\t\tShow help information \n"
}

# Everything is going fine.
success_output() {
	printf "[${GREEN}+${NC}] $1 \n" 	
}

# Warning message.
warning_output() {
	printf "[${ORANGE}!${NC}] $1 \n"
}

# Error message.
error_output() {
	printf "[${RED}-${NC}] $1 \n"
}

# Main function.
change_mac() {
	success_output "Setting network down."
	sudo ip link set $DEVICE down

	success_output "Changing MAC."
	if $verbose ; then
		warning_output "Verbose mode: ON"
		sudo macchanger -m $MAC $DEVICE
	else
		sudo macchanger -m $MAC $DEVICE >/dev/null 2>&1
	fi

	success_output "Setting network up."
	sudo ip link set $DEVICE up
	if $restart_service ; then
		warning_output "Network-manager restarting."
		sudo service network-manager restart
		success_output "Success!"
		success_output "Quitting..."
	fi
}


# Assigning default variables
if ( ! getopts ":md:rvh" opt); then
	warning_output "Using default MAC (0A:1B:2C:3D:4E:5F)"
fi

options=':md:rvh'
while getopts $options option
do
	case $option in
		m ) MAC=$OPTARG; warning_output "Using MAC $MAC";;
		d ) DEVICE=$OPTARG; warning_output "Using device $DEVICE";;
		r ) restart_service=true;;
		v ) verbose=true;;
		h ) usage; exit;;
	esac
done

if [ -z "$MAC" ]; then
	error_output "MAC is not provided"
	exit 1
fi 


change_mac