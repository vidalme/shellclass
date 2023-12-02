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
  if [[ "${BACKUP}" = 'true' ]]
  then
    # checar se ja existe o folder archives	  
    ls /home/archives > /dev/null
    # criar um se nao tiver sido criado ainda
    if [[ "${?}" != 'true' ]]
    then
      mkdir /home/archives	    
    fi
    # arquivar e comprimir folder do usuario e coloca-lo no diretorio archives
    echo 'Archiving and compressing'
    tar cvfz /home/archives/"${USER}".tar.gz /home/"${USER}"/    
  fi
  
}

removeDirectory(){
  # remover diretorio do usuario
  if [[ "${DELETE_FOLDER}" = 'true' ]] 	
  then
    rm -rf /home/"${USER}"
  fi	  

}

removeUser(){
  # deletar o usuario direto
  if [[ ${DELETE_USER} = 'true' ]]
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
  #backup
  #usermod -e 1 -L "${USER}" 
  #removeUser
  #removeDirectory
}

while getopts dra OPTION
do
    case ${OPTION} in
      d)
	DELETE_USER='true'
        echo 'vou deletar direto o user'
	;;
      r)
	DELETE_FOLDER='true'      
        echo 'vou deletear o home folder do user'
	;;
      a)
	BACKUP='true'      
        echo 'Ill backup homedirectory of the user'
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
for USER in "${@}"; do
	if [[ $("${USER}" -u id) -lt 999 ]]
  then
    setUser
  fi
done


