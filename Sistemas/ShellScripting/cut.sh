#!/bin/bash

Str="Learn Bash Commands from UbuntuPit"

#subStr = ${Str:0:20}
subStr=$(echo $Str| cut -d ' ' -f 1-3)

echo $subStr
