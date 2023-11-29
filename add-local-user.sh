# Make sure the script is being executed with superuser privileges.
if [[ "${EUID}" -ne 0 ]]
then
  echo "This script need root privileges"
  exit 1
fi


# Get the username (login).
read -p "Type your name: " NEW_USER_NAME

# i added this check
# chekc if the username is available
if [[ id -u "${NEW_USER_NAME}" > /dev/null ]]
then
  echo "Username ${NEW_USER_NAME} already exists"
  exit 1
fi


# Get the real name (contents for the description field).
#read -p "Type the full name: " FULL_NAME

# Get the password.
# read -p "Type your password: "

# adding prompt fields, cause I am using adduser instead of useradd used in the tutorial
# doing that to make it harder and its more apropriated in debian distros (ubuntu)
# in this case --comment will add in this order fullname, room number, work phone, home phone
#read -p "Type your room number: " ROOM_NUMBER
#read -p "Type your work phone: " WORK_PHONE 
#read -p "Type your home phone: " HOME_PHONE

# Create the user with the password.
#sudo adduser --disabled-password --comment "${FULL_NANE}","${ROOM_NUMBER}","${WORK_PHONE}","${HOME_PHONE}" "${NEW_USER_NAME}"
adduser --comment "" "${NEW_USER_NAME}"

chage -d 0 "${NEW_USER_NAME}"

# Check to see if the useradd command succeeded.
echo "${?}"


# Set the password.
# it was done automatically

# Check to see if the passwd command succeeded.
# done

# Force password change on first login.

# Display the username, password, and the host where the user was created.


