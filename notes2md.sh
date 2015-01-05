#!/bin/sh
#
# Script that converts TGnotes documents to Markdown
#
# Copyright © 2014 Tiancheng "Timothy" Gu
# Licensed under the MIT License.

# This script is only tested on GNU Sed.

# Usage: <this file> <input.tgnotes> [<output.md>]
# If the output file is not specified it is assumed to be standard output

if [ "$#" -lt "1" ] || [ "$#" -gt "2" ]; then
    echo "Incorrect command syntax" >&2
    exit 1
else
    in=$1
    if [ "$#" -eq "2" ]; then
        out="$2"
    else
        out='/dev/stdout'
    fi
fi

sed -r -e 's/^(Chapter)/\# \1/g'             \
       -e 's/^([IVXLCDM]+\.)\t/\#\# \1 /g'   \
       -e 's/^\t([A-Z]+\.)\t/\n\#\#\# \1 /g' \
       -e 's/\t//g'                          \
       "$in" > "$out"
