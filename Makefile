# $Id: Makefile,v 1.3 2002-03-03 19:17:39 turbo Exp $

install all:	clean
	@( \
	  cp -v firewall /etc/init.d/; \
	  if [ ! -f /etc/firewall.conf ]; then \
	    cp -v firewall.conf /etc; \
	  fi; \
	)

clean:
	@rm -f *~ .#*
