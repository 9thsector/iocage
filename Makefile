#
#	Makefile
#

.include <bsd.own.mk>

PREFIX?= /usr/local
MAN=
BINOWN=		root
BINGRP=		wheel
BINMODE=	0555
BINDIR=$(PREFIX)/sbin
FILESDIR=$(PREFIX)/lib/iocage
RCDIR=$(PREFIX)/etc/rc.d
MANDIR=$(PREFIX)/man/man8
MKDIR=mkdir

PROG=	iocage
MAN=	$(PROG).8

install:
	$(MKDIR) -p $(BINDIR)
	$(MKDIR) -p $(FILESDIR)
	$(INSTALL) -m $(BINMODE) $(PROG) $(BINDIR)/
	$(INSTALL) lib/* $(FILESDIR)/
	$(INSTALL) rc.d/* $(RCDIR)/
	rm -f $(MAN).gz
	gzip -k $(MAN)
	$(INSTALL) $(MAN).gz $(MANDIR)/
	rm -f $(MAN).gz

.include <bsd.prog.mk>
