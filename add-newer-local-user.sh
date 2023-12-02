#!/bin/bash
#

#Check if the user is root
if [[ "${EUID}" -ne 0 ]]
then
	echo "${?} needs root to be used." >&2
	exit 1
fi

# checkin if there are any arguments
if [[ ${#} -lt 1 ]]
then
	echo "USAGE: ${0} USER_NAME [COMMENT]..."
	echo "Create and account o the local sustem with the name of USER_NAME and a comments field of COMENT." >&2
	exit 1
fi

# check if the username exists
USERNAME="${1}"
ALL_USERS=$(cut -d ":" -f1 /etc/passwd)

echo ${ALL_USERS} | grep -qw ${USERNAME} >> /dev/null

if [[ "${?}" -eq 0 ]]
then
	echo "The user ${USERNAME} already exists" >&2
	exit 1
fi

# creates a new password
PASSWORD=$(date +%s%N"${RANDOM}" | sha256sum | cut -c 1-20 )

# Creates a new user
COMMENT="${@:2}"
useradd -m -c "${COMMENT}" -p "${PASSWORD}" "${USERNAME}" &> /dev/null

if [[ "${?}" -ne 0 ]]
then
	echo "w/e" >&2
fi

# display message for the helpdesk
echo "New user created Successfully!"
echo "_________INFO_________"
echo "USERNAME: ${USERNAME}"
echo "PASSWORD: ${PASSWORD}"
echo "HOSTNAME: ${HOSTNAME}"
