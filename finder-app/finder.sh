#!/bin/sh
# Jocelyn Villegas
#
# This program obtains two parameters:
# 1 - Path of a directory
# 2 - String to find recursively in the path of the argument 1
#
# Prints the number of files on the path (1) and the number of matching
# lines of the string (2)

# Define inputs
filesdir=$1
searchstr=$2

# Verify if two arguments were specified
if [ $# -ne 2 ]; then
    echo "ERROR: You must specify exactly 2 arguements."
    exit 1
fi

# Verify if argument 1 is a directory
if [ ! -d "$1" ]; then
    echo "ERROR: First argument is not a directory."
    exit 1
fi

# Operation to get the files inside argument 1
x=$(tree $1 | wc -l)

# Operation to obtain number of matching lines
y=$(grep -inr "$2" "$1" | wc -l)

# Print output
echo "The number of files are $x and the number of matching lines are $y"
