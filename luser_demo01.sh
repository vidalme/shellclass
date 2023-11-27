#!/bin/bash

# This script displays various information to the screen.
#
# Display 'Hello'

echo 'Hello'

#Assign a value to a variable
WORD='script'

#Display that value using the variable.
echo "$WORD"

# Demonstrate that single quotes cause variable to NOT get expanded
echo '$WORD'

# combine the variable ith hard-coded text
echo "This is a shell $WORD"

#Display the contents of the variable using an alternative syntax
echo "This is a shell ${WORD}"

#Append text to the variable
echo "${WORD}ing is fun"

#SHow how NOT to appaned txt to a variable
#This does not work:
echo "$WORDing is fun!"

#Create a new variable
ENDING='ed'

#COmbine the two variables
echo "This is ${WORD}${ENDING}"

#change the value stored in the ENDING variable (Reassignment)
ENDING='ing'
echo "${WORD}${ENDING} is fun"
