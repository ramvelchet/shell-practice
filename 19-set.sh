#!/bin/bash

set -a

#error(){
    #echo "there is an error in $LINENO, Command is: $BASH_COMMAND"
#}

trap 'echo "there is an error in $LINENO, Command is: $BASH_COMMAND" ' ERR

echo "hello.."
echo "better error.."
ccaffj1;dnf
echo "After error"