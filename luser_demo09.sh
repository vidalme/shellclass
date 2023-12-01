#!/bin/bash

#This script demonstrate the case statement

#if [[ "${1}" = "start" ]]
#then
#	echo "starting..."
#elif [[ "${1}" = "stop" ]]
#then
#	echo "stopping..."
#elif [[ "${1}" = "status" ]]
#then
#	echo "Staus:"
#else
#	echo "Suplly a valid option." >&2
#	exit 1
#fi
#

#case "${1}" in
#	start)
#		echo "starting."
#		;;
#	stop)
#		echo "stopping."
#		;;
#	status|state|--status|--state)
#		echo "status;"
#		;;
#	*)
#		echo "Suply a valid option" >&2
#		exit 1
#		;;
#esac

case "${1}" in
	start) echo "starting." ;;
	stop) echo "stopping." ;;
	status)	echo "status:" ;;
	*)
		echo "Suply a valid option" >&2
		exit 1
		;;
esac

