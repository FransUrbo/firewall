install all:	clean
	@( \
	  cp -v firewall /etc/init.d/; \
	  if [ ! -f /etc/firewall.conf ]; then \
	    cp -v firewall.conf /etc; \
	  fi; \
	)

clean:
	@rm -f *~ .#*
