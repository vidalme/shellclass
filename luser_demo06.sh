#!/bin/bash

# This script generates a random password for each user specifie on the command line.
# need more vim knowledge

# Display what the user typed on the command line.
echo "You executed this command: ${0}"

# Display the path and filename of the script
echo "The directory of your command is $(dirname ${0}) and the command is $(basename ${0})"

# Tell them how many arguments they passed in.
# (Inside the script they are parameters, outside they are arguments.)
NUMBER_OF_PARAMETERS="${#}"
echo "You suplied ${NUMBER_OF_PARAMETERS} argumets on the command line."

# Make sure they at least supply one argument.
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
  echo "Usage: ${0} USER_NAME [USER_NAME]..."
  exit 1
fi

# Generate and display a password for each parameter.
for USER_NAME in "${@}"
do
  PASSWORD=$( date +%s%N | sha256sum | head -c48 )
  echo "${USER_NAME}: ${PASSWORD}"
done
