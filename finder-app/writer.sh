#!/bin/sh
# Jocelyn Villegas
#
# This program obtains two parameters:
# 1 - Full path of a file
# 2 - String to write in the file
#
# Writes (appends) the string (2) into the file (1)
#

# Define inputs
writefile=$1
writestr=$2

# Verify if two arguments were specified
if [ $# -ne 2 ]; then
    echo "ERROR: You must specify exactly 2 arguements."
    exit 1
fi

# If directory does not exist, create it and create the file
if [ ! -d "$(dirname "$writefile")" ]; then
    mkdir -p "$(dirname "$writefile")"
    touch "$(dirname "$writefile")"
fi

# Append the string to file
echo $writestr >> $writefile
