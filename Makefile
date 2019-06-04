SHELL := /bin/bash -euo pipefail

prefix  := $(HOME)
bin     := $(prefix)/bin
systemd := $(prefix)/.config/systemd/user

progs := fbshow
units := netfb.socket netfb@.service

installed_progs := $(addprefix $(bin)/,$(progs))
installed_units := $(addprefix $(systemd)/,$(units))

install:
	@install -dv $(bin)
	@install -cv $(progs) $(bin)
	@install -dv $(systemd)
	@install -cv $(units) $(systemd)
	systemctl --user enable --now netfb.socket

uninstall:
	@rm -v $(installed_progs) $(installed_units) \
		| perl -pe 'print "rm: "'
