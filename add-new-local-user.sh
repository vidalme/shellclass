#!/bin/bash
#

#Check if the user is root
if [[ "${EUID}" -ne 0 ]]
then
	echo "${?} needs root to be used."
	exit 1
fi

# checkin if there are any arguments
if [[ ${#} -lt 1 ]]
then
	"Parameter ${?}: USERNAME is required"
	exit 1
fi

# check if the username exists
ALL_USERS=$(cut -d ":" -f1 /etc/passwd)
echo ${ALL_USERS} | grep -qw ${1} >> /dev/null

if [[ "${?}" -eq 0 ]]
then
	echo "The user ${1} already exists"
	exit 1
fi

# creates a new password
PASSWORD=$(date +%s%N"${RANDOM}" | sha256sum | cut -c 1-20 )

# Creates a new user
OTHER_PARAMS="${@:2}"
useradd -M -c "${OTHER_PARAMS}" -p "${PASSWORD}" "${1}"

# display message for the helpdesk
echo "New user created Successfully!"
echo "_________INFO_________"
echo "USERNAME: ${1}"
echo "PASSWORD: ${PASSWORD}"
echo "HOSTNAME: ${HOSTNAME}"
