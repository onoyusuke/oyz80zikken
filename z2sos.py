#! /usr/bin/env python
import sys
f = open(sys.argv[1]+'.z80', 'rb')
g = open(sys.argv[1]+'.sos', 'wb')
a = f.read()
g.write('_SOS 01 '+sys.argv[2]+' '+sys.argv[3]+'\x0a'+a[10:len(a)])
f.close
g.close

