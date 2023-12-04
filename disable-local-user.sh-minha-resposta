#!/bin/bash

#sudo or root
if [[ "${EUID}" -ne 0 ]]
then
  echo 'you must be root or use sudo for this command'
  exit 1
fi

#function to present user with the correct form to use the command
usage(){
  echo 'Usage: ${0} [-dra] USER_NAME [USER_NAME]...' >&2
  echo 'OPTIONS:'
  echo '-d Deletes accounts instead of disabling them'
  echo '-r Removes the home directory'
  echo '-a creates and archive of home directory in /archives'
  echo 
}

backup(){
  # arquivamento de diretorios 
  if [[ "${BACKUP}" == 'true' ]]
  then
    # best practice declare the archive directory
    ARCHIVES_DIR="/home/archives"
    # create a new folder, if there is one the command will just skip it
    mkdir -p "${ARCHIVES_DIR}"

    # arquivar e comprimir folder do usuario e coloca-lo no diretorio archives
    # echo 'Archiving and compressing'
    tar cvfz /home/archives/"${USER}".tar.gz /home/"${USER}"/ > /dev/null 2>&1  
  fi
  
}

removeDirectory(){
  # remover diretorio do usuario
  if [[ "${DELETE_FOLDER}" == 'true' ]] 	
  then
    rm -rf /home/"${USER}"
  fi	  

}

removeUser(){
  # deletar o usuario direto
  if [[ ${DELETE_USER} == 'true' ]]
  then
    userdel "${USER}"
  fi

}

backupp(){
  echo "${USER}"
}

setUser(){	
  USER="${USER}"
  backup
  usermod -e 1 -L "${USER}" 
  removeDirectory
  removeUser
}

while getopts dra OPTION
do
    case ${OPTION} in
      d)
	DELETE_USER='true'
        #echo 'vou deletar direto o user'
	;;
      r)
	DELETE_FOLDER='true'      
        #echo 'vou deletear o home folder do user'
	;;
      a)
	BACKUP='true'      
        #echo 'Ill backup homedirectory of the user'
	;;
      ?)
        usage
	exit 1
        ;;
    esac
done    


# remo flags so we can get the argument value
shift "$(( OPTIND - 1  ))"

# check for at least 1 username input
if [[ "${#}" == 0 ]]
then
  usage
  exit 1
fi

 
# quick loop to activate all users
for USER in "${@}"
do
  # if user is a system user shut it down!	
  if [[ "$(id -u ${USER})" -lt 1000 ]]
  then
    echo 'Cannot delete system User'
    usage
    exit 1
  fi
  setUser
done


