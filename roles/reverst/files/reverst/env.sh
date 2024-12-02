#!/bin/sh

cat "env" | while read -r line;
do
    echo "export $line"
done > env.source
