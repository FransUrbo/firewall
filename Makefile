install all:	clean
	@cp firewall /etc/init.d/
	@cp firewall.conf /etc

clean:
	@rm -f *~ .#*
