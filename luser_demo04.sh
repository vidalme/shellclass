#!/bin/bash
#
# This script creates an account on the local sustem.
# You will be prompted for the account name and password.


# Ask for the user name.
read -p 'Enter the username to create: ' USER_NAME

# Ask fr the real name.
read -p 'Enter the name of the person who this account is for: ' COMMENT

# Ask for the password.
read -p 'Enter the password to use for the account: ' PASSWORD 

# Create the user.
sudo useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the user.
#echo ${PASSWORD} | passwd --stdin ${USER_NAME}
echo "${USER_NAME}:${USER_PASSWORD}" | sudo chpasswd

# Force password change on first login.
sudo passwd -e ${USER_NAME}
