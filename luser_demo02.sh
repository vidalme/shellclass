#!/bin/bash

# Display the UID and username of thge user executing this script
# Display if the user is the root user or not.
#
# Display the UID

echo "Your UID is ${UID}"


# Display the username

#older way of doidng
#USER_NAME=`id -un`

# newer way of doing
USER_NAME=$(id -un)

echo "Your username is ${USER_NAME}"

#Display if the user is the root user or not.
if [[ "${UID}" -eq 0 ]]
then
	echo 'You are root.'
else
	echo 'You are not root.'
fi
