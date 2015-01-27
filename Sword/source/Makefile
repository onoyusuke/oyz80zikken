# Generated automatically from Makefile.in by configure.
# Makefile for sos

# CC must be an ANSI-C compiler
CC	= gcc

prefix	= /usr/local
exec_prefix = ${prefix}
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL} -m 755
INSTALL_DATA = ${INSTALL} -m 644

# where you want the binaries and manual page
BINDIR	      = ${exec_prefix}/bin
DOSFILE	      = ${exec_prefix}/lib/sword.bin

## Compile options
# HAVE_CFMAKERAW	have cfmakeraw()
# HAVE_STRERROR		have strerror()
# HAVE_MEMMOVE		have memmove()
# HAVE_SIGPROCMASK	have sigprocmask() [check for POSIX signal funcs]
# HAVE_CURSES_H		have curses.h (preferd than termcap.h)
# HAVE_TERMCAP_H	have termcap.h
# RETSIGTYPE		prototype of signal handler
# TYPE_TPUTS		prototype of putchar function in tputs
#
## optional
# OPT_DELAY_FLUSH	delay flush
# OPT_DELAY_FLUSH_TIME	micro-sec of flush interval
# OPT_DEFAULT_ANSI	assume as ansi termianl if tgetenv failed
# OPT_KEYMAP_WM		set default control key Word Master like
#
## customize
# RCFILE		name of initialization file
#
#ADDOPTS	= -g -DOPT_DEFAULT_ANSI -DRCFILE=\"sos.ini\"
ADDOPTS	      = -g

LIBS	      = -ltermcap  
CFLAGS        =	 -DHAVE_LIBTERMCAP=1 -DHAVE_DIRENT_H=1 -DSTDC_HEADERS=1 -DHAVE_FCNTL_H=1 -DHAVE_LIMITS_H=1 -DHAVE_SGTTY_H=1 -DHAVE_SYS_FILE_H=1 -DHAVE_SYS_IOCTL_H=1 -DHAVE_SYS_TIME_H=1 -DHAVE_UNISTD_H=1 -DHAVE_TERMIOS_H=1 -DHAVE_CURSES_H=1 -DHAVE_TERMCAP_H=1 -DRETSIGTYPE=void -DHAVE_GETCWD=1 -DHAVE_STRDUP=1 -DHAVE_STRERROR=1 -DHAVE_STRTOL=1 -DHAVE_STRCASECMP=1 -DHAVE_CFMAKERAW=1 -DHAVE_MEMMOVE=1 -DHAVE_SIGPROCMASK=1 -DHAVE_FCNTL=1 -DOPT_KEYMAP_WM=1  -DDOSFILE=\"$(DOSFILE)\" $(ADDOPTS)

SRCS	      = sos.c simz80.c trap.c dio.c screen.c util.c keymap.c compat.c
DOC	      = README COPYING

all:		sos

sos:		sos.o simz80.o trap.o dio.o screen.o util.o keymap.o compat.o 
		$(CC) $(LDFLAGS) $(CFLAGS) sos.o simz80.o trap.o dio.o screen.o util.o keymap.o \
		compat.o $(LIBS) -o $@

#simz80.c:	simz80.pl
#		rm -f simz80.c
#		perl -w simz80.pl >simz80.c
#		chmod a-w simz80.c

install:	all
	$(INSTALL_PROGRAM) sos ${exec_prefix}/bin/sos
	$(INSTALL_DATA) sword.bin $(DOSFILE)

clean:;		rm -f *.o *~ core sos.core sos

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<		

# dependencies
simz80.o:	simz80.c simz80.h
sos.o:		sos.c sos.h dio.h screen.h util.h
dio.o:		dio.c dio.h simz80.h sos.h
screen.o:	screen.c screen.h sos.h
trap.o:		trap.c trap.h sos.h dio.h screen.h util.h simz80.h
util.o:		util.c util.h simz80.h
keymap.o:	screen.h
compat.o:	compat.c compat.h
