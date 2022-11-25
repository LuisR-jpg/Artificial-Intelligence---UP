#!/bin/bash

echo -n "Enter any number:"

read n 

if [[ ( $n -eq 15 || $n -eq 45 ) ]]

then

echo "You won"

else

echo "You lost!"

fi
