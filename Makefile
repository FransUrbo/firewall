install all:	clean
	@( \
	  cp firewall /etc/init.d/; \
	  if [ ! -f /etc/firewall.conf ]; then \
	    cp firewall.conf /etc; \
	  if; \
	)

clean:
	@rm -f *~ .#*
