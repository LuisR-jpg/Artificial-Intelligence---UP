#!/bin/bash
ext=$1
name=$2
f=$2"."$1
path="~/Desktop/prueba/Template."$ext
test -f $path && cp $path $f
nvim $f

