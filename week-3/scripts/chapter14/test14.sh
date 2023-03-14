#!/bin/bash
# demonstrating a multi-position shift

echo
echo "The original parameters: $*"
shift 2
echo "Here is the new first parameter: $1"

