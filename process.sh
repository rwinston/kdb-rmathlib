#!/bin/bash

# Autogenerate q link statements 

INFILE=rmath.h
DLL=\`:rmath

echo "dll:$DLL"

DECLARATIONS=$(awk '/\/\/ BEGIN DECL/ {f=1;next} /\/\/ END DECL/ {f=0} f {sub(/K /,"",$0);print $0}' $INFILE)
for decl in $DECLARATIONS; do
    FNAME=${decl%%(*}
    ARGS=${decl##$FNAME}
    IFS=, read -r -a CMDARGS <<< "$ARGS"
    echo "${FNAME}:dll 2:(\`$FNAME;${#CMDARGS[*]})"
done

echo "\\l rmath_aux.q"


