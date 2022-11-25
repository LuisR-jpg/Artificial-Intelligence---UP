#!/bin/bash

sum=0
for(( counter=1; counter<5; counter++ ))

do

echo -n "Enter Your Number:"

read n

(( sum+=n ))

#echo -n "$counter "

done

printf "\n"

echo "Result is: $sum"
