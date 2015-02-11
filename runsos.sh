#!/bin/sh
z80-asm -l $1.asm $2:$1.z80
../z2sos.py $1 $2 $2
sos -l $1.sos -j $2
