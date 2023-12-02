#!/bin/bash

#sudo or root
if [[ "${EUID}" -ne 0 ]]
then
  echo 'you must be root or use sudo for this command'
  exit 1
fi

#function to present user with the correct form to use the command
usage(){
  echo 'The utilty ${0} is usedas ${0} [options] USER_NAME [USER_NAME]...'
  echo 'OPTIONS:'
  echo '-d Deletes accounts instead of disabling them'
  echo '-r Removes the home directory'
  echo '-a creates and archive of home directory in /archives'
  echo 
}



	
