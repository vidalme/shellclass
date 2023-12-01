#!/bin/bash
#
#This script generates a random password.
#This user can set the password length with -l and add a special character with -s.
#Verbose mode can be enabled with -v.
#
#Set a default password length
LENGHT=48

while getopts vl:s OPTION
do
	case ${OPTION} in
		v)
			VERBOSESE
