#!/bin/bash
#
#Demonstrate the use of shift and while lopps.
#
#Display the first three parameters.
echo "Paramenter 1: ${1}"
echo "Paramenter 2: ${2}"
echo "Paramenter 3: ${3}"
echo

# Loop through all the positional parameters.
while [[ "${#}" -gt 0 ]]
do
  echo "Number of paramenters: ${#}"
  echo "Parameter 1: ${1}"
  echo "Parameter 2: ${2}"
  echo "Parameter 3: ${3}"
  echo
  shift
done
