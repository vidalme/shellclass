#!/bin/bash

log() {
	# This function send a message to syslog and to STDOUT if VERBOSE is true.
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t ${0} "${MESSAGE}"
}

backup_file() {
	# This function creates a backup of a file. Returns nnon-zero status on error.
	
	local FILE="${1}"

	#Make sure the file exists.
	if [[ -f "${FILE}" ]]
	then
		local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
		log "Backing up ${FILE} to ${BACKUP_FILE}."

		# The exit status of the function will be the status of the cp command.
		cp -p ${FILE} ${BACKUP_FILE}
	else
		# The file does not exist, so return a non-zero exit status.
		return 1

	fi
}
readonly VERBOSE='true'
log 'hello!'
log 'This is fun'

backup_file '/etc/passwd'

if [[ "${?}" -ne 0 ]]
then
	echo 'The file ${@} could not have been backed up'
	exit 1
fi

echo 'The file ${1} has been backed up.'
