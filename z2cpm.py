#! /usr/bin/env python
import sys
f = open(sys.argv[1]+'.z80', 'rb')
g = open(sys.argv[1]+'.cpm', 'wb')
a = f.read()
g.write(a[10:len(a)])
f.close
g.close
