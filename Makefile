# $Id: Makefile,v 1.4 2002-03-04 11:47:08 turbo Exp $

install all:	clean
	@( \
	  cp -v firewall /etc/init.d/; \
	  cp -v reject_ip /usr/local/sbin/; \
	  if [ ! -f /etc/firewall.conf ]; then \
	    cp -v firewall.conf /etc; \
	  fi; \
	)

clean:
	@rm -f *~ .#*
