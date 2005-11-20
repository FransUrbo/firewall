# $Id: Makefile,v 1.5 2005-11-20 16:58:38 turbo Exp $

DATE    := $(shell date +"%Y%m%d")
TMPDIR  := $(shell tempfile)

INSTDIR := firewall-$(DATE)

$(INSTDIR):
	@(if [ -f $(TMPDIR) ]; then \
	    rm -f $(TMPDIR); \
	  fi; \
	  mkdir -p $(TMPDIR)/$(INSTDIR); \
	  echo "Instdir:   "$(TMPDIR)/$(INSTDIR))

install all:	clean
	@( \
	  cp -v firewall /etc/init.d/; \
	  cp -v reject_ip /usr/local/sbin/; \
	  if [ ! -f /etc/firewall.conf ]; then \
	    cp -v firewall.conf /etc; \
	  fi; \
	)

tarball: $(INSTDIR)
	@(mkdir -p $(TMPDIR)/$(INSTDIR)/etc/init.d; \
	  mkdir -p $(TMPDIR)/$(INSTDIR)/usr/local/sbin; \
	  cp firewall $(TMPDIR)/$(INSTDIR)/etc/init.d; \
	  cp firewall.conf firewall.local $(TMPDIR)/$(INSTDIR)/etc/; \
	  cp reject_ip $(TMPDIR)/$(INSTDIR)/usr/local/sbin; \
	  cd $(TMPDIR)/$(INSTDIR); \
	  tar czf ../firewall-$(DATE).tgz `find . -type f`; \
	  tar cjf ../firewall-$(DATE).tar.bz2 `find . -type f`; \
	  zip ../firewall-$(DATE).zip `find . -type f` > /dev/null)

clean:
	@rm -f *~ .#*
