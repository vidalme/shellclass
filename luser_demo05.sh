#!/bin/bash

#This script generates a list of random passwords.

# A random number as a password.
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers together.

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Use the current date/time as the basis for the password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nanosecond to act as randomization.

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# limiting the number of characters
PASSWORD="$( date +%s+%N | sha256sum | head -c8 )"
echo "${PASSWORD}"

# A even better password.
PASSWORD=$( date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48 )
echo "${PASSWORD}"

# the best password of this list.
SPECIAL=$( echo '!@#$%¨&*()_-+=' | fold -w1 | shuf | head -c1 )
PASSWORD=$( date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48 )${SPECIAL}
echo "${PASSWORD}"
