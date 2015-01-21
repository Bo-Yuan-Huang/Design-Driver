#! /bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <input> <output>"
else
    cat $1 | sed 's/_[XY][0-9A-Z]\+_A12T[SR]//' > $2
    cat netlist/lib.v >> $2
fi


